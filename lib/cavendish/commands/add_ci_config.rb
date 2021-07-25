module Cavendish
  module Commands
    class AddCiConfig < Cavendish::Commands::Base
      def perform
        copy_ci_and_version_files
      end

      private

      def copy_ci_and_version_files
        copy_file(".circleci/config.yml", ".circleci/config.yml")
        copy_file(".node-version", ".node-version")
      end
    end
  end
end
