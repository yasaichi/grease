require "spec_helper"

RSpec.describe Grease::Adapter do
  let(:adapter) { described_class.new(template_class) }
  let(:template_class) { Tilt::ERBTemplate }

  describe "#call" do
    subject do
      adapter.call(
        data: "<%= Math::PI.round(2) %>",
        environment: Sprockets::Environment.new,
        filename: "/path/to/foo.html.erb",
        metadata: {}
      )
    end

    it { is_expected.to match a_hash_including(data: "3.14") }
  end

  describe "#inspect" do
    subject { adapter.inspect }
    it { is_expected.to match(/#<#{described_class.name}\(#{template_class.name}\):0x[0-9a-f]{14}>/) }
  end
end
