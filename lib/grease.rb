require "grease/adapter"
require "grease/version"

module Grease
  def self.apply(template_class)
    Grease::Adapter.new(template_class)
  end
end
