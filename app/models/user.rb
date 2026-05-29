class User < ApplicationRecord
  has_many :watchlist_items, dependent: :destroy
end
