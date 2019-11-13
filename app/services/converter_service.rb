# frozen_string_literal: true

class ConverterService < BaseService
  BYN = Currencies::CURRENCY_WITH_ABBREVIATIONS[:belarus_ruble]

  def initialize(banknote_1, banknote_2, converter)
    @banknote_1 = banknote_1
    @banknote_2 = banknote_2
    @converter = converter
  end

  def call
    result = calculated_result
    converter.update result: result
  end

  private

  attr_reader :converter, :banknote_1, :banknote_2

  def calculated_result
    return buy_currency if converter.banknote_name == BYN
    return sell_currency if converter.banknote_name_2 == BYN
    two_steps_operation
  end

  def buy_currency
    converter.update selling_rate: banknote_2.selling_rate
    converter.amount / converter.selling_rate
  end

  def sell_currency
    converter.update purchase_rate: banknote_1.purchase_rate
    converter.amount * converter.purchase_rate
  end

  def two_steps_operation
    converter.update purchase_rate: banknote_1.purchase_rate
    first_convertion = converter.amount * converter.purchase_rate
    converter.update selling_rate: banknote_2.selling_rate
    converter.amount / converter.selling_rate
  end
end
