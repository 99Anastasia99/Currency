# frozen_string_literal: true

class DashboardController < Admin::BaseController
  include Currencies

  before_action :authenticate_admin!

  def show
    @banknotes = Banknote.all
  end
end
