module Cavendish
  module Commands
    class AddReactNavigation < Cavendish::Commands::Base
      def perform
        install_dependencies
      end

      private

      def install_dependencies
        run_in_project("yarn add #{react_navigation_core_dependencies.join(' ')}")
        run_in_project("npx expo install #{react_navigation_side_dependencies.join(' ')}")
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
