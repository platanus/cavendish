module Cavendish
  module Commands
    class AddTemplateFiles < Cavendish::Commands::Base
      def perform
        copy_tailwind_config_file
        copy_provider_file
        copy_sample_navigator_and_screens
        replace_app_entrypoint
        copy_test_files
      end

      private

      def copy_tailwind_config_file
        copy_file('tailwind.config.js', 'tailwind.config.js')
      end

      def copy_provider_file
        copy_file('src/providers/AppProvider.tsx', 'src/providers/AppProvider.tsx')
      end

      def copy_sample_navigator_and_screens
        copy_template('src/screens/HomeScreen.tsx', 'src/screens/HomeScreen.tsx')
        copy_file('src/navigators/HomeNavigator.tsx', 'src/navigators/HomeNavigator.tsx')
      end

      def replace_app_entrypoint
        remove_in_project('App.tsx')
        copy_file('App.tsx', 'App.tsx')
      end

      def copy_test_files
        copy_template(
          'src/screens/__specs__/HomeScreen.spec.tsx',
          'src/screens/__specs__/HomeScreen.spec.tsx'
        )
      end
    end
  end
end
