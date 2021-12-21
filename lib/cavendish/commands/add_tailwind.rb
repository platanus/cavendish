module Cavendish
  module Commands
    class AddTailwind < Cavendish::Commands::Base
      def perform
        install_tailwind_rn_dependencies
        copy_tailwind_config_file
        generate_tailwind_rn_styles_json
        copy_tailwind_utils
      end

      private

      def install_tailwind_rn_dependencies
        run_in_project('yarn add tailwind-rn')
        run_in_project("yarn add -D tailwindcss@#{Cavendish::TAILWIND_VERSION}")
      end

      def copy_tailwind_config_file
        copy_file('tailwind.config.js', 'tailwind.config.js')
      end

      def generate_tailwind_rn_styles_json
        run_in_project('yarn run create-tailwind-rn')
      end

      def copy_tailwind_utils
        copy_file('src/utils/tailwindRn.js', 'src/utils/tailwindRn.js')
      end
    end
  end
end
