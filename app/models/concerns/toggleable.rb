# frozen_string_literal: true

require "active_support/concern"

module Toggleable
  extend ActiveSupport::Concern
  PENDING = :pending
  INACTIVE = :inactive
  ACTIVE = :active

  included do
    scope :active, -> { where active: true }
    scope :inactive, -> { where active: false }
  end

  def activate!
    update_attribute :active, true
  end

  def deactivate!
    update_attribute :active, false
  end

  def state
    return ACTIVE if active?

    INACTIVE
  end

  def status
    state.to_s.capitalize
  end
end
