class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :album

  def self.create_from_path(path)
    return if exists?(path: path) || !AudioInfo.is_audio_file?(path)

    AudioInfo.open(path) do |info|
      create!(
        artist_name: info.artist,
        title: info.title,
        album_name: info.album,
        tracknum: info.tracknum.to_i,
        path: path
      )
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by!(name: name)
  end

  def album_name=(name)
    self.album = Album.find_or_create_by!(title: title)
  end

  def song
    self
  end
end
