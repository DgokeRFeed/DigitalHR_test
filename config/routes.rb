Rails.application.routes.draw do
  API_METHODS = %i[index create]

  root to: 'pings#ping'

  namespace :api do
    resources :users, only: API_METHODS
    resources :interests, only: API_METHODS
    resources :skills, only: API_METHODS
  end
end
