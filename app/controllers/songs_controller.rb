class SongsController < ApplicationController
  def index
    @songs = Song.includes(:artist, :album).order("artists.name, albums.title, tracknum ASC")
  end

  def show
    send_file Song.find(params[:id]).path
  end
end
