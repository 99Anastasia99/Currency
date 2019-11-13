# frozen_string_literal: true

class ConvertersController < ApplicationController
  PERMITTED_PARAMS = %i[banknote_name
                        banknote_name_2
                        user_name
                        user_surname
                        amount
                        type_of_operation
                        purchase_rate
                        selling_rate
                        result].freeze
  def new
    @converter = Converter.new
  end

  def create
    @converter = Converter.new(converter_params)
    if @converter.save
      ConverterService.call(banknote_1, banknote_2, @converter)
      @converter.result
    else
      flash[:alert] = @converter.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  private

  def banknote_1
    @banknote_1 ||= Banknote.find_by(name: converter_params.fetch(:banknote_name))
  end

  def banknote_2
    @banknote_2 ||= Banknote.find_by(name: converter_params.fetch(:banknote_name_2))
  end

  def converter_params
    params.require(:converter).permit(PERMITTED_PARAMS)
  end
end
