# frozen_string_literal: true

class AppSettingsController < Admin::BaseController
  APP_SETTINGS_FIELDS = %i[
    max_operation_amount
    min_operation_amount
    min_rate
    max_rate
    session_timeout_in
  ].freeze

  def show
    @app_settings = AppSetting.current
  end

  def update
    @app_settings = AppSetting.current
    if @app_settings.update(app_setting_params)
      redirect_to app_settings_path, notice: "Settings updated"
    else
      render :show
    end
  end

  private

  def app_setting_params
    params.require(:app_setting).permit(*APP_SETTINGS_FIELDS)
  end
end
