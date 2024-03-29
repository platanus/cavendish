module Cavendish
  class CLI
    include Commander::Methods

    def run
      config = Cavendish::Config.new
      define_program
      define_create_command(config)
      run!
    end

    private

    def define_program
      program :name, 'Cavendish'
      program :version, Cavendish::VERSION
      program :description, 'React Native + Expo project generator for Platanus'
    end

    def define_create_command(config)
      global_option('--no-node-version-check') { $no_node_version_check = true }

      command('create') do |c|
        c.syntax = 'cavendish create'
        c.description = 'Create a new React Native + Expo project'
        c.action do |args|
          setup_config(config, args)
          create_command_steps.each { |command| command.for(config: config) }
        end
      end
    end

    def create_command_steps
      [
        Cavendish::Commands::CreateExpoProject,
        Cavendish::Commands::AddTailwind,
        Cavendish::Commands::AddEslint,
        Cavendish::Commands::AddAliasSupport,
        Cavendish::Commands::AddReactNavigation,
        Cavendish::Commands::AddRedux,
        Cavendish::Commands::AddTesting,
        Cavendish::Commands::AddCiConfig,
        Cavendish::Commands::AddEASConfiguration,
        Cavendish::Commands::AddReadme,
        Cavendish::Commands::AddTemplateFiles,
        Cavendish::Commands::PatchDependencies,
        Cavendish::Commands::Cleanup,
        Cavendish::Commands::ConfigureGit
      ]
    end

    def setup_config(config, args)
      Cavendish::NodeVersionEnsurer.new.ensure! unless $no_node_version_check

      config.project_name = args.first
    end
  end
end
