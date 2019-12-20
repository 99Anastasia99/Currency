# frozen_string_literal: true

class Cashier::ResetPasswordsController < BaseResetPasswordsController
  private

  def user
    Cashier.find(params.fetch(:cashier_id))
  end

  def path
    cashiers_path
  end
end
