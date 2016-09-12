require "spec_helper"

RSpec.describe Grease::Adapter do
  describe "#call" do
    subject do
      described_class.new(Tilt::ERBTemplate).call(
        data: "<%= Math::PI.round(2) %>",
        environment: Sprockets::Environment.new,
        filename: "/path/to/foo.html.erb",
        metadata: {}
      )
    end

    it { is_expected.to match a_hash_including(data: "3.14") }
  end
end
