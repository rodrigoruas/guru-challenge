class User < ApplicationRecord

  validates :subscription, inclusion: { in: %w(Basic Premium Professional) }

  def self.get_user(email)
    User.where(email: email)&.first
  end

  private

  def check_password(user, password)
    Argon2::Password.verify_password(password, user.password_hash)
  end
end
