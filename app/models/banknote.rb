# frozen_string_literal: true

class Banknote < ApplicationRecord
  VALIDATIONS = %i[name
                   purchase_rate
                   selling_rate].freeze

  belongs_to :operation, required: false

  validates(*VALIDATIONS, presence: true)
  validates_numericality_of :purchase_rate, :selling_rate,
                            greater_than_or_equal_to: AppSetting.first.min_rate,
                            less_than_or_equal_to: AppSetting.first.max_rate
end
