class User < ApplicationRecord
  has_many :watchlist_items, dependent: :destroy
  has_many :movies, through: :watchlist_items

  has_secure_password
  before_validation :normalize_email

  validates :email, presence: true, uniqueness: true

  private

  def normalize_email
    self.email = email.to_s.strip.downcase
  end
end
