class CreateWatchlistItems < ActiveRecord::Migration[8.1]
  def change
    create_table :watchlist_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.string :status, null: false, default: "want_to_watch"
      t.boolean :favorite, null: false, default: false

      t.timestamps
    end

    add_index :watchlist_items, [ :user_id, :movie_id ], unique: true
  end
end
