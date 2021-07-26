module Cavendish
  module Commands
    class AddTesting < Cavendish::Commands::Base
      def perform
        install_dependencies
        add_config_and_scripts_to_package
        add_example_test_file
      end

      private

      def install_dependencies
        run_in_project("yarn add -D #{jest_dependencies.join(' ')}")
      end

      def add_config_and_scripts_to_package
        inject_to_json_file('package.json', jest_options)
      end

      def add_example_test_file
        copy_template(
          'src/screens/__specs__/HomeScreen.spec.js',
          'src/screens/__specs__/HomeScreen.spec.js'
        )
      end

      def jest_dependencies
        %w[
          jest
          fishery
          jest-expo
          @testing-library/jest-dom
          @testing-library/react-native
        ]
      end

      def jest_options
        {
          scripts: { test: 'jest' },
          jest: {
            preset: 'jest-expo',
            transform: { '^.+\\.[jt]sx?$': 'babel-jest' }
          }
        }
      end
    end
  end
end
