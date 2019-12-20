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

  validates_numericality_of :amount, greater_than_or_equal_to: 2, less_than_or_equal_to: 10_000

  validates(*VALIDATIONS, presence: true)
end
