Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: "home#index"

  resources :games, only: [:index, :new, :create, :show]
  resources :pokemon_games

end
