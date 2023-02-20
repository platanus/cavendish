module Cavendish
  module Commands
    class AddEASConfiguration < Cavendish::Commands::Base
      def perform
        install_eas_cli
        register_and_create_organization_prompt
        login_to_expo
        configure_project_owner
        set_basic_project_config
        inject_advanced_eas_config
      end

      private

      REGISTER_MESSAGE = <<~MSG
        To configure Expo Application Services (EAS) into your app, it is necessary to have an expo account. Please register at https://expo.dev/signup if you don't have an account (enter to continue).
      MSG
      CREATE_ORGANIZATION_MESSAGE = <<~MSG
        If you are planning to collaborate with others in this project, it is adviced to create an organization. Create an organization at https://expo.dev/create-organization (enter to continue)
      MSG

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

      def register_and_create_organization_prompt
        ask(REGISTER_MESSAGE)
        ask(CREATE_ORGANIZATION_MESSAGE)
      end

      def login_to_expo
        run_in_project('eas login')
      end

      def configure_project_owner
        run_in_project('eas project:init')
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
