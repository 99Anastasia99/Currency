# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @banknotes = Banknote.all
    @converter = Converter.new
  end
end
