# frozen_string_literal: true

class FormsController < ApplicationController
  def next_day
    @day = Day.first
    @day.update current_date: @day.current_date + 1.day
    redirect_back(fallback_location: root_path)
  end

  def base_currency
    BaseCurrency.first.update name: params.fetch(:name)
  end
end
