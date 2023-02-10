module Cavendish
  module Commands
    class AddTemplateFiles < Cavendish::Commands::Base
      def perform
        copy_tailwind_config_file
      end

      private

      def copy_tailwind_config_file
        copy_file('tailwind.config.js', 'tailwind.config.js')
      end
    end
  end
end
