# frozen_string_literal: true

class Admin::ResetPasswordsController < BaseResetPasswordsController
  private

  def user
    Admin.find(params.fetch(:admin_id))
  end

  def path
    admins_path
  end
end
