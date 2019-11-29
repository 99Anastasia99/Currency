# frozen_string_literal: true

class OperationsController < ApplicationController
  PERMITTED_PARAMS = %i[banknote_name
                        banknote_name_2
                        user_name
                        user_surname
                        cashier_name
                        cashier_surname
                        amount
                        type_of_operation
                        purchase_rate
                        selling_rate
                        result
                        date_of_operation].freeze
  def new
    @operation = Operation.new
  end

  def create
    @operation = Operation.new(operation_params)
    if @operation.save
      ConverterService.call(banknote_1, banknote_2, @operation)
      save_pdf
    else
      flash[:alert] = @operation.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  def index
    @q = Operation.ransack(params[:q])
    @q.sorts = "email asc" if @q.sorts.empty?
    @operations = @q.result.page(params[:page])
  end

  private

  def save_pdf
    send_data @operation.receipt.render,
      filename: "#{@operation.date_of_operation.strftime("%d-%m-%Y")}-receipt.pdf",
      type: "application/pdf"
  end

  def banknote_1
    @banknote_1 ||= Banknote.find_by(name: operation_params.fetch(:banknote_name))
  end

  def banknote_2
    @banknote_2 ||= Banknote.find_by(name: operation_params.fetch(:banknote_name_2))
  end

  def date_parameter
    { date_of_operation: Day.first.current_date }
  end

  def operation_params
    params.require(:operation).merge(date_parameter).permit(PERMITTED_PARAMS)
  end
end
