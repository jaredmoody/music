class PlaylistSong < ApplicationRecord
  belongs_to :playlist
  belongs_to :song

  acts_as_list scope: :playlist
end
