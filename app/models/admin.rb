class Admin < ApplicationRecord
  include DeviseInvitable::Inviter
  include Toggleable

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :invitable, :rememberable, :validatable, :omniauthable, :lockable

  validates :password, password_complexity: true, if: :password_required?
  validates :email, presence: true, uniqueness: true
  validates :name, :surname, presence: true

  def state
    return PENDING unless accepted_or_not_invited?
    super
  end

  def accept_invitation!
    self.confirm
    super
  end

  def active_for_authentication?
    super && active?
  end
end
