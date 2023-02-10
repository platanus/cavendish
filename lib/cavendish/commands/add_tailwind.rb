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
    end
  end
end
