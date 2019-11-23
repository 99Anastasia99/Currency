# frozen_string_literal: true

class BaseInvitationController < Devise::InvitationsController
  PERMITTED_PARAMS = [
    :name,
    :surname,
    :email,
    :password,
    :password_confirmation,
    :invitation_token
  ].freeze

  private

  def permitted_params
    []
  end

  def required_params
    []
  end

  def invite_params
    permitted = permitted_params.present? ? permitted_params : PERMITTED_PARAMS
    params.require(required_params).permit(permitted)
  end
end
