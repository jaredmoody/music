class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :album, index: true
      t.string :title
      t.integer :tracknum
      t.integer :length
      t.string :path, index: true
      t.timestamps
    end
  end
end
