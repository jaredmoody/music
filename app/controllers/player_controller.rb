class PlayerController < ApplicationController
  def show
    @song = Song.find params[:id]
    session[:current_song] = @song.id
  end
end
