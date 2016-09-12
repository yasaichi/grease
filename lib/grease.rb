require "grease/adapter"
require "grease/version"

module Grease
  def self.apply(engine)
    Grease::Adapter.new(engine)
  end
end
