module Cavendish
  module Commands
    class CreateExpoProject < Cavendish::Commands::Base
      def perform
        install_expo_globally
        create_expo_project
      end

      private

      def install_expo_globally
        run("yarn global add expo-cli@#{Cavendish::EXPO_CLI_VERSION}")
      end

      def create_expo_project
        run("expo init #{config.project_name} --template blank")
      end
    end
  end
end
