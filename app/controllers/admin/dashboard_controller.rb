# frozen_string_literal: true

class Admin::DashboardController < Admin::BaseController
  def show
    Day.first || Day.create(current_date: Date.today)
    @banknotes = Banknote.all
    @operation = Operation.new
    @base_currency = BaseCurrency.first || BaseCurrency.create(name: "USD")
  end
end
