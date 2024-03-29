module Cavendish
  module Commands
    class AddTemplateFiles < Cavendish::Commands::Base
      def perform
        copy_tailwind_config_file
        copy_provider_file
        copy_sample_navigator_and_screens
        replace_app_entrypoint
        copy_test_files
        copy_type_files
        copy_app_config
        replace_babel_config
        copy_redux_setup_files
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

      def copy_type_files
        copy_file('src/types/user.d.ts', 'src/types/user.d.ts')
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
        copy_file('__mocks__/tailwind-rn.ts', '__mocks__/tailwind-rn.ts')
        copy_file('__mocks__/@react-navigation/native.ts', '__mocks__/@react-navigation/native.ts')
      end

      def copy_app_config
        copy_template('app.config.ts', 'app.config.ts')
      end

      def replace_babel_config
        remove_in_project('babel.config.js')
        copy_file('babel.config.js', 'babel.config.js')
      end

      def copy_redux_setup_files
        copy_file('src/store/index.ts', 'src/store/index.ts')
        copy_file('src/store/hooks.ts', 'src/store/hooks.ts')
        copy_file('src/store/reducers.ts', 'src/store/reducers.ts')
      end
    end
  end
end
