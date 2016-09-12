require "spec_helper"

RSpec.describe Grease do
  describe ".apply" do
    subject { described_class.apply(Tilt::ERBTemplate) }
    it { is_expected.to be_an_instance_of(Grease::Adapter) }
  end
end
