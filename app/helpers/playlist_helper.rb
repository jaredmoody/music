module PlaylistHelper
  def playlist_class(playlist)
    playlist ? dom_class(playlist) : nil
  end

  def playlist_data(playlist)
    { controller: 'playlist', playlist_url_value: playlist_path(playlist) }
  end
end
