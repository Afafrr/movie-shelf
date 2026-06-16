class User < ApplicationRecord
  before_validation :normalize_email

  has_many :watchlist_items, dependent: :destroy
  has_many :movies, through: :watchlist_items

  has_secure_password

  validates :email, presence: true, uniqueness: true

  private

  def normalize_email
    self.email = email.to_s.strip.downcase
  end
end
