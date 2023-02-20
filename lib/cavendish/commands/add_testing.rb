module Cavendish
  module Commands
    class AddTesting < Cavendish::Commands::Base
      def perform
        install_dependencies
        add_config_to_package
        add_testing_library_dependencies
      end

      private

      def install_dependencies
        run_in_project("yarn add -D #{jest_dependencies.join(' ')}")
      end

      def add_config_to_package
        inject_to_json_file('package.json', package_configuration)
      end

      def add_testing_library_dependencies
        run_in_project("yarn add -D #{dependencies.join(' ')}")
      end

      def add_jest_globals_to_eslint
        inject_to_json_file('.eslintrc.json', jest_globals)
      end

      def jest_dependencies
        %w[
          jest
          fishery
          jest-expo
        ]
      end

      def dependencies
        %w[
          @testing-library/jest-dom
          @testing-library/react-native
        ]
      end

      def package_configuration
        {
          scripts: { test: 'jest' },
          jest: {
            preset: 'jest-expo',
            transform: { '^.+\\.[jt]sx?$': 'babel-jest' }
          }
        }
      end

      def jest_globals
        {
          env: {
            jest: true
          }
        }
      end
    end
  end
end
