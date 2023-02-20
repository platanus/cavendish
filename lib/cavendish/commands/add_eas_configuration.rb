module Cavendish
  module Commands
    class AddEASConfiguration < Cavendish::Commands::Base
      def perform
        install_eas_cli
        login_to_expo
        set_basic_project_config
        inject_advanced_eas_config
      end

      private

      EAS_ADVANCED_CONFIG = {
        build: {
          development: {
            channel: 'development'
          },
          staging: {
            channel: 'staging',
            android: {
              buildType: 'apk'
            },
            env: {
              APP_ENV: 'staging'
            }
          },
          production: {
            channel: 'production',
            env: {
              APP_ENV: 'production'
            }
          }
        }
      }

      def install_eas_cli
        run_in_project('npm install -g eas-cli')
      end

      def login_to_expo
        run_in_project('eas login')
      end

      def set_basic_project_config
        run_in_project('eas build:configure')
      end

      def inject_advanced_eas_config
        rename_preview_to_staging
        inject_to_json_file('eas.json', EAS_ADVANCED_CONFIG)
      end

      def rename_preview_to_staging
        rename_key_in_json('eas.json', 'build.preview', 'staging')
      end
    end
  end
end
