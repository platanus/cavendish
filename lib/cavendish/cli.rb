module Cavendish
  class CLI
    include Commander::Methods

    def run
      program :name, "Cavendish"
      program :version, Cavendish::VERSION
      program :description, "React Native + Expo project generator for Platanus"

      command("hello") do |c|
        c.syntax = "cavendish hello"
        c.description = "Just a command example"
        c.action { puts "Hello Platanus!" }
      end

      run!
    end
  end
end
