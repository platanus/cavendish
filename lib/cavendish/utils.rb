module Cavendish
  module Utils
    def gsub_file(in_project_path, flag, *args, &block)
      path = File.join(project_root_path, in_project_path)
      content = File.binread(path)
      content.gsub!(flag, *args, &block)
      File.open(path, "wb") { |file| file.write(content) }
    end

    def copy_file(source, destination)
      log 'CREATE', destination
      ::FileUtils.cp(get_template_path(source), get_or_generate_destination_path(destination))
    end

    def copy_template(source, destination, locales = {})
      log 'CREATE', destination
      template_path = "#{get_template_path(source)}.erb"
      destination_path = get_or_generate_destination_path(destination)
      template_contents = File.read(template_path)
      File.open(destination_path, 'w+') do |output|
        output.write(parse_erb(template_contents, locales))
      end
    end

    def remove_in_project(path)
      log 'REMOVE', path
      full_path = File.join(project_root_path, path)
      return ::FileUtils.rm_rf(File.join(project_root_path, path)) if File.exist?(full_path)

      error "Can't delete because #{full_path} does not exist"
    end

    def run(cmd, error_message = nil)
      log 'RUN', cmd
      system cmd
      error(error_message) if $?.exitstatus != 0
    end

    def run_in_project(cmd, error_message = nil)
      log 'RUN', cmd
      system "cd #{project_root_path}; #{cmd}"
      error(error_message) if $?.exitstatus != 0
      system "cd .."
    end

    def inject_to_json_file(path, hash_representation)
      package_path = File.join(project_root_path, path)
      package_contents = JSON.parse(File.read(package_path))
      new_contents = package_contents.deep_merge(hash_representation.with_indifferent_access)
      File.write(package_path, JSON.pretty_generate(new_contents))
    end

    def inject_to_file(in_project_path, new_content)
      log 'INJECTING', in_project_path
      path = File.join(project_root_path, in_project_path)
      content = File.binread(path)
      content += "#{new_content}\n"
      File.open(path, "wb") { |file| file.write(content) }
    end

    def get_or_generate_destination_path(destination)
      destination_path = File.join(project_root_path, destination)
      ::FileUtils.mkdir_p(File.dirname(destination_path))
      destination_path
    end

    def get_template_path(file_path)
      File.join(File.dirname(__FILE__), "assets", file_path)
    end

    def project_root_path
      File.join(Dir.pwd, @config.project_name)
    end

    def parse_erb(content, data)
      bind = binding
      data.each { |key, value| singleton_class.send(:define_method, key) { value } }
      ERB.new(content, trim_mode: '-').result(bind)
    end

    def log(action, msg)
      puts "\t[#{action.green}] #{msg}"
    end

    def error(msg)
      puts "\t[#{'ERROR'.red}] #{msg}"
    end
  end
end
