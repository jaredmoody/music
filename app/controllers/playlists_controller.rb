class PlaylistsController < ApplicationController
  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(name: params[:playlist][:name])

    if @playlist.save
      redirect_back fallback_location: root_path
    else
      render action: 'new'
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
    @pagy, @songs = pagy(@playlist.playlist_songs.includes(:song), items: 100)

    render 'songs/index'
  end
end
