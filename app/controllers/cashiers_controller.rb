# frozen_string_literal: true

class CashiersController < ApplicationController
  PERMIT_KEY = :cashier
  PERMITTED_PARAMS = %i[
    name
    surname
    email
  ].freeze

  def show
    @banknotes = Banknote.all
    @operation = Operation.new
  end

  def index
    @q = Cashier.ransack(params[:q])
    @q.sorts = "email asc" if @q.sorts.empty?
    @cashiers = @q.result.page(params[:page])
    @day = Day.first
  end

  def destroy
    @cashier = Cashier.find(params[:id])
    if current_cashier != @cashier && @cashier.destroy
      flash[:notice] = "Cashier was successfully removed."
    else
      flash[:alert] = "Cashier can not be removed."
    end
    redirect_to action: :index
  end

  def update
    @cashier = Cashier.find(params.fetch(:id))
    respond_to do |format|
      format.json { respond_with_bip(@cashier) }
      if @cashier.update(cashier_params)
        format.html { redirect_to(@cashier, notice: "Cashier was successfully updated.") }
      else
        format.html { render action: :edit }
      end
    end
  end

  private

  def cashier_params
    params.require(PERMIT_KEY).permit(PERMITTED_PARAMS)
  end
end
