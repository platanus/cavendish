module Cavendish
  module Commands
    class AddAliasSupport < Cavendish::Commands::Base
      ALIASES = {
        "@": "src",
        "assets": "assets"
      }

      def perform
        add_typescript_settings
      end

      private

      def add_typescript_settings
        inject_to_json_file('tsconfig.json', typescript_settings)
      end

      def typescript_settings
        {
          compilerOptions: {
            baseUrl: ".",
            paths: ALIASES.map { |from, to| { "#{from}/*": ["#{to}/*"] } }.inject(:merge)
          }
        }
      end
    end
  end
end
