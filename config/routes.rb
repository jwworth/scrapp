Rails.application.routes.draw do
  root 'games#index'

  resources :games
  resources :players
end
