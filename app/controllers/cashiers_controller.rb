# frozen_string_literal: true

class CashiersController < ApplicationController
  def show
    @banknotes = Banknote.all
    @converter = Converter.new
  end
end
