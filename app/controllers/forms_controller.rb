# frozen_string_literal: true

class FormsController < ApplicationController
  DATE_NOW = "date_now"
  PREVIOUS = "previous"

  def next_day
    @day = Day.first
    @day.update current_date: date
    redirect_back(fallback_location: root_path)
  end

  def base_currency
    BaseCurrency.first.update name: params.fetch(:name)
  end

  private

  def date
    return Time.now if period == DATE_NOW
    return @day.current_date - 1.day if period == PREVIOUS

    @day.current_date + 1.day
  end

  def period
    @period ||= params[:format]
  end
end
