class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string :external_id
      t.string :title
      t.integer :year
      t.string :poster_url
      t.text :overview

      t.timestamps
    end
    add_index :movies, :external_id, unique: true
  end
end
