class PlaylistSong < ApplicationRecord
  belongs_to :playlist
  belongs_to :song

  acts_as_list scope: :playlist

  delegate :title, :artist, to: :song
end
