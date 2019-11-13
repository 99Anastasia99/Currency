class Converter < ApplicationRecord
  extend Enumerize

  TYPES = %w[buy sell].freeze

  enumerize :type_of_operation, in: TYPES

  has_many :banknotes
end
