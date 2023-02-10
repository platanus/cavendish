module Cavendish
  module Commands
    class CreateExpoProject < Cavendish::Commands::Base
      def perform
        create_expo_project
      end

      private

      def create_expo_project
        run("npx create-expo-app #{config.project_name} --template blank")
      end
    end
  end
end
