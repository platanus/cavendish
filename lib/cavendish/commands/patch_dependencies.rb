module Cavendish
  module Commands
    class PatchDependencies < Cavendish::Commands::Base
      def perform
        add_script_to_package
        install_patch_package
        create_patch_packages_files
        run_in_project('yarn install')
      end

      PACKAGES_TO_PATCH = {
        'tailwind-rn': 'tailwind-rn+4.2.0.patch'
      }

      private

      def install_patch_package
        run_in_project('yarn add patch-package postinstall-postinstall')
      end

      def add_script_to_package
        inject_to_json_file('package.json', post_install_patch_package)
      end

      def create_patch_packages_files
        PACKAGES_TO_PATCH.each do |package_name, filename|
          copy_file("patches/#{package_name}/#{filename}", "patches/#{filename}")
        end
      end

      def post_install_patch_package
        {
          scripts: { postinstall: "patch-package" }
        }
      end
    end
  end
end
