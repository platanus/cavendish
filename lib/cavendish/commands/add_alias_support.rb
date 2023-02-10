module Cavendish
  module Commands
    class AddAliasSupport < Cavendish::Commands::Base
      ALIASES = {
        "@": "src",
        "assets": "assets"
      }

      def perform
        add_typescript_settings
        install_eslint_dependencies
        add_eslint_settings
        add_babel_settings
      end

      private

      def add_typescript_settings
        inject_to_json_file('tsconfig.json', typescript_settings)
      end

      def install_eslint_dependencies
        run_in_project("yarn add -D eslint-import-resolver-typescript")
      end

      def add_eslint_settings
        inject_to_json_file('.eslintrc.json', eslint_settings)
      end

      def add_babel_settings
        gsub_file('babel.config.js', "presets: ['babel-preset-expo'],", babel_settings)
      end

      def typescript_settings
        {
          compilerOptions: {
            baseUrl: ".",
            paths: ALIASES.map { |from, to| { "#{from}/*": ["#{to}/*"] } }.inject(:merge)
          }
        }
      end

      def eslint_settings
        {
          settings: {
            "import/resolver": {
              typescript: {}
            }
          }
        }
      end

      def babel_settings
        <<~BABEL.strip
          presets: ['babel-preset-expo'],
          plugins: [
            ['module-resolver', {
              alias: {
                #{ALIASES.map { |from, to| "'#{from}': `${__dirname}/#{to}`" }.join(
                  ",\n\t\t\t\t\t"
                )}
              },
            }],
          ],
        BABEL
      end
    end
  end
end
