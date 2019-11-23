# frozen_string_literal: true

class Cashier::InvitationsController < BaseInvitationController
  private

  def required_params
    :cashier
  end

  def authenticate_inviter!
    send(:"authenticate_admin!", force: true)
  end
end
