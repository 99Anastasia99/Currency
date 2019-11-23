class Operation < ApplicationRecord
  extend Enumerize

  TYPES = %w[buy sell].freeze
  VALIDATIONS = %i[banknote_name
                   banknote_name_2
                   user_name
                   user_surname
                   amount].freeze

  enumerize :type_of_operation, in: TYPES

  has_many :banknotes

  validates_numericality_of :amount, greater_than_or_equal_to: 2

  validates(*VALIDATIONS, presence: true)
end
