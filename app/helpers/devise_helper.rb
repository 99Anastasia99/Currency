# frozen_string_literal: true

module DeviseHelper
  def devise_error_messages!
    return unless devise_controller?
    resource.errors.full_messages.map do |message|
      render(
        partial: 'shared/flash_message',
        locals: { key: 'warning', value: message }
      )
    end.join.html_safe
  end

  def path_to_resource(resource)
    session_path(resource)
  end

  def login_title(resource_class)
    t("devise.sessions.log_in_as", resource: resource_class.name.titleize)
  end

  def invitation_token(params)
    return params[:admin][:invitation_token] if params[:admin]
    return params[:cashier][:invitation_token] if params[:cashier]
    params[:invitation_token]
  end

  def opposite_resource_class(resource)
    resource.is_a?(Admin) ? Cashier : Admin
  end

  def path_to_opposite_resource(resource)
    session_path(opposite_resource_class(resource))
  end
end
