module Cavendish
  module Commands
    class Base < PowerTypes::Command.new(:config)
      include Cavendish::Utils

      attr_reader :config
    end
  end
end
