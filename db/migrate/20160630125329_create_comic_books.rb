class CreateComicBooks < ActiveRecord::Migration
  def change
    create_table :comic_books do |t|
      t.string :title
      t.text :description
      t.integer :artist_id
      t.integer :author_id
      t.timestamps
    end
  end
end
