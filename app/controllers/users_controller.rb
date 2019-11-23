# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @banknotes = Banknote.all
    @operation = Operation.new
  end
end
