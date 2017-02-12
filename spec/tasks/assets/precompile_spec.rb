require "rails_helper"

describe "rake assets:precompile" do
  before(:context) do
    Rails.application.load_tasks
  end

  describe "precompiled templates" do
    let(:env) { Rails.application.assets }
    let(:context_class) { env.context_class }

    before(:context) do
      Rake::Task["assets:precompile"].execute
    end

    %w(foo.haml bar.html.haml).each do |basename|
      logical_path = "#{basename.split(".").first}.html"

      describe logical_path do
        describe "body" do
          subject { File.read(File.join(Rails.public_path, context.asset_path(logical_path))) }

          let(:context) { context_class.new(environment: env, filename: source_path, metadata: {}) }
          let(:source_path) { Rails.root.join("app/assets/templates", basename) }

          it { is_expected.to eq Tilt::HamlTemplate.new(source_path).render(context) }
        end
      end
    end

    after(:context) do
      Rake::Task["assets:clobber"].execute
      FileUtils.rm_rf(Rails.root.join("tmp/cache"))
    end
  end
end
