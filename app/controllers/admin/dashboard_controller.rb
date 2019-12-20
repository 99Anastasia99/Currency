# frozen_string_literal: true

class Admin::DashboardController < Admin::BaseController
  def show
    @banknotes = Banknote.all
    @operation = Operation.new
    @base_currency = BaseCurrency.first
  end
end
