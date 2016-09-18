require "rails_helper"

describe "rake assets:precompile" do
  before(:context) do
    Rails.application.load_tasks
  end

  describe "precompiled templates" do
    before(:context) do
      Rake::Task["assets:precompile"].execute
    end

    %w(foo.haml bar.html.haml).each do |basename|
      logical_path = "#{basename.split(".").first}.html"

      describe logical_path do
        subject { File.read(File.join(Rails.public_path, asset_path)) }

        let(:asset_path) { ActionController::Base.helpers.asset_path(logical_path) }
        let(:source_path) { Rails.root.join("app/assets/templates", basename) }

        it { is_expected.to eq Tilt::HamlTemplate.new(source_path).render }
      end
    end

    after(:context) do
      Rake::Task["assets:clobber"].execute
      FileUtils.rm_rf(Rails.root.join("tmp/cache"))
    end
  end
end
