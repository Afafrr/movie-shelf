class WatchlistItem < ApplicationRecord
  STATUS_OPTIONS = ["want_to_watch", "watching", "watched"]

  belongs_to :movie
  belongs_to :user

  validates :status, presence: true, inclusion: { in: STATUS_OPTIONS }
  validates :movie_id, uniqueness: { scope: :user_id }
end
