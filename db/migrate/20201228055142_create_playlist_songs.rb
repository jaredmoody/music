class CreatePlaylistSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :playlist_songs do |t|
      t.belongs_to :playlist, index: true, null: false
      t.belongs_to :song, index: true, null: false
      t.integer :position, null: false
      t.timestamps
    end
  end
end
