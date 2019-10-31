# frozen_string_literal: true

module DashboardHelper
ADMIN_DASHBOARD = "Admin::DashboardController"

  def admin(controller)
    controller.class.name == ADMIN_DASHBOARD
  end

  def currency_with_abbreviations
    Currencies::CURRENCY_WITH_ABBREVIATIONS.map { |key, value| [key.to_s.titleize, value]}
  end

  def currency_with_abbreviations_for_edit
    Currencies::CURRENCY_WITH_ABBREVIATIONS.map { |key, value| [value, key.to_s.titleize]}
  end
end
