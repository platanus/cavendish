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
        Cavendish::Commands::AddTesting,
        Cavendish::Commands::AddCiConfig,
        Cavendish::Commands::AddReadme,
        Cavendish::Commands::ConfigureGit,
        Cavendish::Commands::AddTemplateFiles,
        Cavendish::Commands::PatchDependencies
      ]
    end

    def setup_config(config, args)
      config.project_name = args.first
      config.testing_library = choose(
        'Which testing library would you like to use?',
        'Enzyme (unit orientated library)',
        '@testing-library/react-native (integration orientated library)'
      )
    end
  end
end
