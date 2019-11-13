class Banknote < ApplicationRecord
  VALIDATIONS = %i[name
                   purchase_rate
                   selling_rate].freeze

  belongs_to :converter, required: false

  validates(*VALIDATIONS, presence: true)
  validates_numericality_of :purchase_rate, :selling_rate, greater_than_or_equal_to: 0.1
end
