module Cavendish
  module Commands
    class AddReadme < Cavendish::Commands::Base
      def perform
        parse_and_copy_file
      end

      private

      def parse_and_copy_file
        copy_template('README.md', 'README.md')
      end
    end
  end
end
