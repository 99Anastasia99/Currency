# frozen_string_literal: true

class Admin::InvitationsController < BaseInvitationController
  private

  def required_params
    :admin
  end

  def edit
    binding.pry
  end
end
