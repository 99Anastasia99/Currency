class Cashier < ApplicationRecord
  include DeviseInvitable::Inviter
  include Toggleable

  devise :database_authenticatable, :registerable, :recoverable,
         :invitable, :rememberable, :validatable

  validates :password, password_complexity: true, if: :password_required?
  validates :email, presence: true, uniqueness: true
  validates :name, :surname, presence: true
end
