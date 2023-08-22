module Cavendish
  module Commands
    class AddCiConfig < Cavendish::Commands::Base
      def perform
        copy_ci_and_version_files
      end

      private

      def copy_ci_and_version_files
        copy_template(".circleci/config.yml", ".circleci/config.yml")
        copy_template(".node-version", ".node-version")
      end
    end
  end
end
