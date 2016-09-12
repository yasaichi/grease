# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "grease/version"

Gem::Specification.new do |spec|
  spec.name          = "grease"
  spec.version       = Grease::VERSION
  spec.authors       = ["yasaichi"]
  spec.email         = ["yasaichi@users.noreply.github.com"]

  spec.summary       = "Tilt adapter for Sprockets 3 or later"
  spec.description   = "Grease provides an adapter to use Tilt as extension of Sprockets 3 or later."
  spec.homepage      = "https://github.com/yasaichi/grease"
  spec.license       = "MIT"

  spec.files         = Dir["CHANGELOG.md", "lib/**/*", "LICENSE.txt", "README.md"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
end
