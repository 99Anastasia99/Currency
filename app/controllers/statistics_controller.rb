# frozen_string_literal: true

class StatisticsController < ApplicationController
  PERIODS = %w[month week day all].freeze

  def index
    @period = params[:period]
    PERIODS.include?(@period) ? @period : @period = "all"
  end
end
