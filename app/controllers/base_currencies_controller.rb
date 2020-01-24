# frozen_string_literal: true

class BaseCurrenciesController < ApplicationController
  def update
    BaseCurrency.first.update name: params.fetch(:base_currency).fetch(:name)
    redirect_back(fallback_location: root_path)
  end
end
