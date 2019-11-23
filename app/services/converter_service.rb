# frozen_string_literal: true

class ConverterService < BaseService
  BYN = Currencies::CURRENCY_WITH_ABBREVIATIONS[:belarus_ruble]

  def initialize(banknote_1, banknote_2, operation)
    @banknote_1 = banknote_1
    @banknote_2 = banknote_2
    @operation = operation
  end

  def call
    result = calculated_result
    operation.update result: result
  end

  private

  attr_reader :operation, :banknote_1, :banknote_2

  def calculated_result
    return buy_currency if operation.banknote_name == BYN
    return sell_currency if operation.banknote_name_2 == BYN
    two_steps_operation
  end

  def buy_currency
    operation.update selling_rate: banknote_2.selling_rate
    operation.amount / operation.selling_rate
  end

  def sell_currency
    operation.update purchase_rate: banknote_1.purchase_rate
    operation.amount * operation.purchase_rate
  end

  def two_steps_operation
    operation.update purchase_rate: banknote_1.purchase_rate
    first_convertion = operation.amount * operation.purchase_rate
    operation.update selling_rate: banknote_2.selling_rate
    operation.amount / operation.selling_rate
  end
end
