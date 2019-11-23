# frozen_string_literal: true

class Admin::DashboardController < Admin::BaseController
  def show
    @banknotes = Banknote.all
    @operation = Operation.new
  end
end
