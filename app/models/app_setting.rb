# frozen_string_literal: true

class AppSetting < ApplicationRecord
  DEFAULT_SESSION_TIMEOUT_MINUTES = 30

  class << self
    def current
      first_or_create(session_timeout_in: DEFAULT_SESSION_TIMEOUT_MINUTES.minutes)
    end
  end

  validates(*AppSettingsController::APP_SETTINGS_FIELDS,
            presence: true,
            numericality: { greater_than: 0 })

  def session_timeout_in_duration
    session_timeout_in.minutes
  end
end
