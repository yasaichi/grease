# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grease/version'

Gem::Specification.new do |spec|
  spec.name          = "grease"
  spec.version       = Grease::VERSION
  spec.authors       = ["yasaichi"]
  spec.email         = ["yasaichi@users.noreply.github.com"]

  spec.summary       = "Tilt adapter for Sprockets 4 or later"
  spec.description   = "Grease provides an adapter to use Tilt as Transformer of Sprockets 4 or later."
  spec.homepage      = "https://github.com/yasaichi/grease"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
