module Cavendish
  module Commands
    class AddTemplateFiles < Cavendish::Commands::Base
      def perform
        copy_tailwind_config_file
        copy_tailwind_provider_file
      end

      private

      def copy_tailwind_config_file
        copy_file('tailwind.config.js', 'tailwind.config.js')
      end

      def copy_tailwind_provider_file
        copy_file('src/providers/AppProvider.tsx', 'src/providers/AppProvider.tsx')
      end
    end
  end
end
