# frozen_string_literal: true

module DashboardHelper
ADMIN_DASHBOARD = "Admin::DashboardController"
BYN = Currencies::CURRENCY_WITH_ABBREVIATIONS[:belarus_ruble]

  def admin(controller)
    controller.class.name == ADMIN_DASHBOARD
  end

  def available_currencies_for_convert(banknotes)
    currency_with_abbreviations.map do |curency, abbrev|
      [curency, abbrev] if list_of_banknotes(banknotes).include?(abbrev) || abbrev == BYN
    end
      .reject(&:blank?)
  end

  # def available_currencies_for_create(banknotes)
  #   currency_with_abbreviations.map do |curency, abbrev|
  #     [curency, abbrev] if !list_of_banknotes(banknotes).include?(abbrev)
  #   end
  #     .reject(&:blank?)
  # end

  def list_of_banknotes(banknotes)
    banknotes.map { |banknote| banknote.name }
  end

  private

  def currency_with_abbreviations
    Currencies::CURRENCY_WITH_ABBREVIATIONS.map { |key, value| [key.to_s.titleize, value]}
  end

  def currency_with_abbreviations_for_edit
    Currencies::CURRENCY_WITH_ABBREVIATIONS.map { |key, value| [value, key.to_s.titleize]}
  end
end
