class Banknote < ApplicationRecord
  belongs_to :converter, required: false
end
