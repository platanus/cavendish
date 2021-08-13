module Cavendish
  module Commands
    class AddTesting < Cavendish::Commands::Base
      def perform
        install_dependencies
        add_config_to_package
        @config.use_enzyme? ? add_enzyme_options : add_rn_testing_library_options
        add_example_test_file
      end

      private

      def install_dependencies
        run_in_project("yarn add -D #{jest_dependencies.join(' ')}")
      end

      def add_config_to_package
        inject_to_json_file('package.json', package_configuration)
      end

      def add_enzyme_options
        run_in_project("yarn add -D #{enzyme_dependencies.join(' ')}")
        inject_to_json_file('package.json', enzyme_configuration)
      end

      def add_rn_testing_library_options
        run_in_project("yarn add -D #{rn_testing_library_dependencies.join(' ')}")
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
        ]
      end

      def rn_testing_library_dependencies
        %w[
          @testing-library/jest-dom
          @testing-library/react-native
        ]
      end

      def enzyme_dependencies
        %w[
          enzyme
          enzyme-adapter-react-16
          jest-enzyme
          jest-environment-enzyme
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

      def enzyme_configuration
        {
          jest: {
            setupFilesAfterEnv: ['jest-enzyme'],
            testEnvironment: 'enzyme'
          }
        }
      end
    end
  end
end
