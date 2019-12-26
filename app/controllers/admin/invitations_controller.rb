# frozen_string_literal: true

class Admin::InvitationsController < BaseInvitationController
  private

  def required_params
    :admin
  end

  def authenticate_inviter!
    send(:"authenticate_admin!", force: true)
  end

  def edit
  end
end
