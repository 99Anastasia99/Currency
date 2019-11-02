# frozen_string_literal: true

class Admin::DashboardController < Admin::BaseController
  before_action :authenticate_admin!
end
