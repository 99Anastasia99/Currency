# frozen_string_literal: true

class BaseResetPasswordsController < Admin::BaseController
  def create
    user.send_reset_password_instructions
    flash[:alert] = I18n.t("actions.reset_password_alert", email: user.email)
    redirect_to path
  end

  private

  def user
    raise NotImplementedError, "define this method in descendant class"
  end

  def path
    raise NotImplementedError, "define this method in descendant class"
  end
end
