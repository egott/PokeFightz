Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: "home#index"

  resources :games, only: [:index, :new, :create]
  resources :pokemon_games

end
