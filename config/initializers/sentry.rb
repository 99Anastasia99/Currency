# frozen_string_literal: true

if %w[production staging].include?(Rails.env)
  Raven.configure do |config|
    config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
    config.async = ->(event) { SentryJob.perform_later(event) }
  end
end
