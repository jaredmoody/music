class PlaylistSongsController < ApplicationController
  def destroy
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.find(params[:id])
    @playlist.songs.delete(@song)

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@song) }
      format.html         { redirect_to messages_url }
    end
  end
end
