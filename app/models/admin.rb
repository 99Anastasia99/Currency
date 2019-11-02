class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :omniauthable, :lockable

  validates :password, password_complexity: true, if: :password_required?
  validates :email, uniqueness: true
end
