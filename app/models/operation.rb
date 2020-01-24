# frozen_string_literal: true

class Operation < ApplicationRecord
  extend Enumerize
  include Receipt

  TYPES = %w[purchase sell].freeze
  VALIDATIONS = %i[banknote_name
                   banknote_name_2
                   user_name
                   user_surname
                   amount].freeze

  enumerize :type_of_operation, in: TYPES

  has_many :banknotes

  validates_numericality_of :amount, greater_than_or_equal_to: AppSetting.first.min_operation_amount,
                                     less_than_or_equal_to: AppSetting.first.max_operation_amount

  validates(*VALIDATIONS, presence: true)
end
