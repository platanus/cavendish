# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cavendish/version"

Gem::Specification.new do |spec|
  spec.name          = "cavendish"
  spec.version       = Cavendish::VERSION
  spec.authors       = ["Platanus"]
  spec.email         = ["rubygems@platan.us"]
  spec.homepage      = "https://github.com/platanus/cavendish/master"
  spec.summary       = "React Native + Expo project generator for Platanus"
  spec.description   = "React Native + Expo project generator for Platanus"
  spec.license       = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "colorize"
  spec.add_dependency "commander", "~> 4.4", ">= 4.4.0"
  spec.add_development_dependency "bundler", "~> 2.2.15"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec_junit_formatter"
  spec.add_development_dependency "rubocop", "~> 1.9"
  spec.add_development_dependency "rubocop-rails"
end
