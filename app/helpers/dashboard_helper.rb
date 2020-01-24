# frozen_string_literal: true

module DashboardHelper
  ADMIN_DASHBOARD = "Admin::DashboardController"

  def admin(controller)
    controller.class.name == ADMIN_DASHBOARD
  end

  def available_currencies_for_convert(banknotes)
    currency_with_abbreviations.map do |curency, abbrev|
      [curency, abbrev] if list_of_banknotes(banknotes).include?(abbrev) || abbrev == base_currency_name
    end
                               .reject(&:blank?)
  end

  def available_currencies_for_create(banknotes)
    currency_with_abbreviations.map do |curency, abbrev|
      [curency, abbrev] unless list_of_banknotes(banknotes).include?(abbrev)
    end
                               .reject(&:blank?)
  end

  def currencies_for_edit(banknotes, name)
    currency_with_abbreviations_for_edit.map do |abbrev, currency|
      [abbrev, currency] if list_of_banknotes(banknotes).exclude?(abbrev) || abbrev == name
    end
                                        .reject(&:blank?)
  end

  def list_of_banknotes(banknotes)
    banknotes.map(&:name)
  end

  private

  def base_currency_name
    @base_currency_name ||= BaseCurrency.first.name
  end

  def currency_with_abbreviations
    Currencies::CURRENCY_WITH_ABBREVIATIONS.map { |key, value| [key.to_s.titleize, value] }
  end

  def currency_with_abbreviations_for_edit
    Currencies::CURRENCY_WITH_ABBREVIATIONS.map { |key, value| [value, key.to_s.titleize] }
  end

  def cashier_name
    current_cashier&.name || current_admin&.name
  end

  def cashier_surname
    current_cashier&.surname || current_admin&.surname
  end
end
