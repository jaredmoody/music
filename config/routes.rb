Rails.application.routes.draw do
  devise_for :users

  resources :playlists
  resources :songs
  resources :artists

  get 'player/:id', to: 'player#show', as: 'player'

  root 'songs#index'
end
