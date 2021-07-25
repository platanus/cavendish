require "commander"
require "colorize"
require "power-types"

require "cavendish/version"
require "cavendish/config"
require "cavendish/utils"

require "cavendish/commands/base"
Dir[File.join(__dir__, 'cavendish', 'commands', '*.rb')].each { |path| require_relative path }

module Cavendish
end
