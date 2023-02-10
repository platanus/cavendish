module Cavendish
  module Commands
    class AddReactNavigation < Cavendish::Commands::Base
      def perform
        install_dependencies
        add_example_navigator_and_screens
        replace_app_entrypoint
      end

      private

      def install_dependencies
        run_in_project("yarn add #{react_navigation_core_dependencies.join(' ')}")
        run_in_project("npx expo install #{react_navigation_side_dependencies.join(' ')}")
      end

      def add_example_navigator_and_screens
        copy_template('src/screens/HomeScreen.tsx', 'src/screens/HomeScreen.tsx')
        copy_file('src/navigators/HomeNavigator.tsx', 'src/navigators/HomeNavigator.tsx')
      end

      def replace_app_entrypoint
        remove_in_project('App.tsx')
        copy_file('App.tsx', 'App.tsx')
      end

      def react_navigation_core_dependencies
        [
          "@react-navigation/native@#{Cavendish::REACT_NAVIGATION_VERSION}",
          "@react-navigation/stack@#{Cavendish::REACT_NAVIGATION_VERSION}"
        ]
      end

      def react_navigation_side_dependencies
        %w[
          react-native-gesture-handler
          react-native-reanimated
          react-native-screens
          react-native-safe-area-context
          @react-native-community/masked-view
        ]
      end
    end
  end
end
