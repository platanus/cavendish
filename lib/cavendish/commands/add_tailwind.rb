module Cavendish
  module Commands
    class AddTailwind < Cavendish::Commands::Base
      def perform
        install_tailwind_rn_dependencies
        run_setup_script
      end

      private

      def install_tailwind_rn_dependencies
        run_in_project('yarn add tailwind-rn')
      end

      def run_setup_script
        run_in_project('npx setup-tailwind-rn')
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
