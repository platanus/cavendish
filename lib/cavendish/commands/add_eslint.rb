module Cavendish
  module Commands
    class AddEslint < Cavendish::Commands::Base
      def perform
        install_airbnb_eslint
        install_typescript_eslint_dependencies
        copy_config_file
      end

      private

      def copy_config_file
        copy_file(".eslintrc.json", ".eslintrc.json")
      end

      def install_airbnb_eslint
        run_in_project('npx install-peerdeps --dev eslint-config-airbnb --yarn')
      end

      def install_typescript_eslint_dependencies
        run_in_project("yarn add -D #{eslint_dependencies.join(' ')}")
      end

      def eslint_dependencies
        %w[
          eslint-config-airbnb-typescript
          @typescript-eslint/eslint-plugin@^5.13.0
          @typescript-eslint/parser@^5.0.0
        ]
      end
    end
  end
end
