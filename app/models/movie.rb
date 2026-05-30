class Movie < ApplicationRecord
  has_many :watchlist_items, dependent: :destroy
  has_many :users, through: :watchlist_items

  validates :external_id, presence: true, uniqueness: true
  validates :title, presence: true
end
