# frozen_string_literal: true

module StatusesHelper
  STATUSES_TO_METHODS_MAPPING = {
    active: 'delete',
    inactive: 'create'
  }.freeze

  STATUSES_TO_CLASS_MAPPING = {
    active: 'btn-warning',
    inactive: 'btn-success'
  }.freeze

  def link_to_toggle_status(user, link, options={}, &block)
    link_to I18n.t("statuses.toggle.#{user_status(user)}"), link, prepare_options(user_status(user), options), &block
  end

  private

  def user_status(user)
    user.active? ? :active : :inactive
  end

  def prepare_options(status, options)
    options.tap do |modified_options|
      modified_options[:class] = [modified_options.fetch(:class, ''), link_class(status)].join(" ")
      modified_options[:method] = method_to_toggle_status(status)
    end
  end

  def link_class(status)
    STATUSES_TO_CLASS_MAPPING.fetch(status)
  end

  def method_to_toggle_status(status)
    STATUSES_TO_METHODS_MAPPING.fetch(status)
  end
end
