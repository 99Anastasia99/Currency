# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session
  layout :layout_by_resource

  ADMIN_LAYOUT = "admin"
  APPLICATION_LAYOUT = "application"

  protected

  def layout_by_resource
    return ADMIN_LAYOUT if devise_controller?

    APPLICATION_LAYOUT
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name surname email])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name surname email])
  end

  def after_sign_in_path_for(resource)
    return stored_location_for(resource) if stored_location_for(resource)

    root_path
  end
end
