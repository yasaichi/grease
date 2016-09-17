require "rails_helper"

describe "rake assets:precompile" do
  before(:context) do
    Rails.application.load_tasks
  end

  describe "precompiled templates" do
    subject { File.read(digest_path) }

    let(:basename) { "foo.html" }
    let(:source_path) { Rails.root.join("app/assets/templates", basename.sub(/\.html\z/, ".haml")) }
    let(:digest_path) { File.join(Rails.public_path, ActionController::Base.helpers.asset_path(basename)) }

    before do
      Rake::Task["assets:precompile"].execute
    end

    it { is_expected.to eq Tilt::HamlTemplate.new(source_path).render }

    after do
      Rake::Task["assets:clobber"].execute
      Rake::Task["tmp:cache:clear"].execute
    end
  end
end
