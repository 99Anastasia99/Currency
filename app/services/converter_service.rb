# frozen_string_literal: true

class ConverterService < BaseService
  def initialize(banknote1, banknote2, operation)
    @banknote1 = banknote1
    @banknote2 = banknote2
    @operation = operation
  end

  def call
    result = calculated_result
    operation.update result: result
  end

  private

  attr_reader :operation, :banknote1, :banknote2

  def calculated_result
    return buy_currency if operation.banknote_name == base_currency
    return sell_currency if operation.banknote_name_2 == base_currency

    operation.update type_of_operation: Operation.type_of_operation.purchase
    two_steps_operation
  end

  def buy_currency
    operation.update selling_rate: banknote2.selling_rate
    operation.update type_of_operation: Operation.type_of_operation.sell
    operation.amount / operation.selling_rate
  end

  def sell_currency
    operation.update purchase_rate: banknote1.purchase_rate
    operation.update type_of_operation: Operation.type_of_operation.purchase
    operation.amount * operation.purchase_rate
  end

  def two_steps_operation
    update_rates!
    first_convertion = operation.amount * operation.purchase_rate
    first_convertion / operation.selling_rate
  end

  def update_rates!
    operation.update purchase_rate: banknote1.purchase_rate
    operation.update selling_rate: banknote2.selling_rate
  end

  def base_currency
    @base_currency ||= BaseCurrency.first.name
  end
end
