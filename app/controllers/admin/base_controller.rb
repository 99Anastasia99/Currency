# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  layout "admin"
  # before_action :authenticate_admin!

  private

  def set_en_language
    I18n.locale = "en"
  end
end
