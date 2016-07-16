# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zaim/version'

Gem::Specification.new do |spec|
  spec.name          = "zaim"
  spec.version       = Zaim::VERSION
  spec.authors       = ["toshiwo"]
  spec.email         = ["toshiwo@toshiwo.com"]
  spec.description   = %q{A Ruby wrapper for the Zaim API.}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/toshiwo/zaim"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'faraday', '~> 0.8.7'
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.9.0'
  spec.add_runtime_dependency 'simple_oauth', '~> 0.2.0'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.5.0"
  spec.add_development_dependency "rspec", ">= 2.11.0"
  spec.add_development_dependency "simplecov", "~> 0.11.2"
  spec.add_development_dependency 'webmock', "= 1.13.0"
  spec.add_development_dependency 'json_spec', "= 1.1.1"
end
