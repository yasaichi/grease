require_relative 'boot'

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "action_mailer/railtie"
require "active_job/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)
require "grease"
require "tilt/haml"

module Dummy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.configure do |env|
      major_version = Sprockets::VERSION.split(".").first.to_i

      if major_version == 3
        env.register_engine ".haml", Grease.apply(Tilt::HamlTemplate), mime_type: "text/html", silence_deprecation: true
      elsif major_version >= 4
        env.register_mime_type "text/haml", extensions: %w(.haml .html.haml)
        env.register_transformer "text/haml", "text/html", Grease.apply(Tilt::HamlTemplate)
      end
    end

    # NOTE: Enable us to get the template path by ActionController::Base.helpers.asset_path
    config.assets.precompile += %w(foo.html bar.html)
  end
end

