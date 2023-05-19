module Cavendish
  module Commands
    class Cleanup < Cavendish::Commands::Base
      def perform
        lint_generated_files
        delete_npm_lock
      end

      def lint_generated_files
        run_in_project('yarn eslint . --fix')
      end

      def delete_npm_lock
        remove_in_project('package-lock.json')
      end
    end
  end
end
