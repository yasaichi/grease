$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "simplecov"
require "codeclimate-test-reporter"

SimpleCov.start do
  add_filter "/spec/"

  formatter SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ])
end

require "grease"
require "sprockets"
require "tilt"
