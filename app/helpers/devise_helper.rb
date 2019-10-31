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
end
