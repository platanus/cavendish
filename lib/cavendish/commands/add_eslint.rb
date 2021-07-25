module Cavendish
  module Commands
    class AddEslint < Cavendish::Commands::Base
      def perform
        copy_config_file
        install_eslint_dependencies
      end

      private

      def copy_config_file
        copy_file(".eslintrc.json", ".eslintrc.json")
      end

      def install_eslint_dependencies
        run_in_project("yarn add -D #{eslint_dependencies.join(' ')}")
      end

      def eslint_dependencies
        %w[
          babel-eslint
          eslint
          eslint-config-airbnb
          eslint-import-resolver-alias
          eslint-plugin-import
          eslint-plugin-jsx-a11y
          eslint-plugin-react
          eslint-plugin-react-hooks
        ]
      end
    end
  end
end
