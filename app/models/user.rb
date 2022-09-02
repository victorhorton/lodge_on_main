class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }

  private

  def password_minimums
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:password, "can't be in the past")
    end
  end
end
