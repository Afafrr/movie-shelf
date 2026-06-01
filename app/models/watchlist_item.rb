class WatchlistItem < ApplicationRecord
  STATUS_OPTIONS = {
    "want_to_watch" => "Want to watch",
    "watching" => "Watching",
    "watched" => "Watched",
  }

  belongs_to :movie
  belongs_to :user

  validates :movie, presence: true
  validates :user, presence: true
  validates :status, presence: true, inclusion: { in: STATUS_OPTIONS.keys }
  validates :favorite, inclusion: { in: [true, false] }
  validates :movie_id, uniqueness: { scope: :user_id }
end
