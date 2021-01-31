Rails.application.routes.draw do
  devise_for :users

  resources :playlists do
    resources :songs, controller: 'playlist_songs'
  end

  resources :songs
  resources :artists

  get 'player/:id', to: 'player#show', as: 'player'

  root 'songs#index'
end
