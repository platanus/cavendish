module Cavendish
  module Commands
    class ConfigureGit < Cavendish::Commands::Base
      def perform
        remove_expo_git
        commit_initial_config
      end

      private

      def remove_expo_git
        remove_in_project(".git")
      end

      def commit_initial_config
        run_in_project("git init")
        run_in_project("git add -A")
        run_in_project("git commit -m 'chore: initial commit'")
      end
    end
  end
end
