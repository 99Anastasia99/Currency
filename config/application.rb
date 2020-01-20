# frozen_string_literal: true

require_relative "boot"

require "rails/all"
require "sprockets/railtie"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

class Currency::Application < Rails::Application
  begin
    ENV.update YAML.load_file("config/application.yml")[Rails.env]
  rescue StandardError
    {}
  end
  # Initialize configuration defaults for originally generated Rails version.
  config.load_defaults "6.0"
  config.autoloader = :classic
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration can go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded after loading
  # the framework and any gems in your application.
end
