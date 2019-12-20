# frozen_string_literal: true

class BanknotesController < ApplicationController
  PERMIT_KEY = :banknote
  PERMITTED_PARAMS = %i[
    name
    purchase_rate
    selling_rate
  ].freeze

  def new
    @banknotes = Banknote.all
    @banknote = Banknote.new
  end

  def edit
    @banknotes = Banknote.find(params[:id])
  end

  def create
    @banknotes = Banknote.all
    @banknote = Banknote.new(banknote_params)
    if @banknote.save
      flash[:notice] = "Banknote was successfully created."
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @banknote = Banknote.find(params.fetch(:id))
    respond_to do |format|
      if @banknote.update(banknote_params)
        format.html { redirect_to(@banknote, notice: "Banknote was successfully updated.") }
        format.json { respond_with_bip(@banknote) }
      else
        format.html { render action: :edit }
        format.json { respond_with_bip(@banknote) }
      end
    end
  end

  def show
    @banknote = Banknote.find(params.fetch(:id))
  end

  def index
    @banknotes = Banknote.all
  end

  private

  def banknote_params
    params.require(PERMIT_KEY).permit(PERMITTED_PARAMS)
  end
end
