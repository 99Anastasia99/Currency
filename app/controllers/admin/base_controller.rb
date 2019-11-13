# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!
  efore_action :authenticate_cashier!

  private

  def set_en_language
    I18n.locale = "en"
  end
end
