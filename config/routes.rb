Rails.application.routes.draw do

  root to: 'cocktails#index'

  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end

  get 'cocktails/:cocktail_id/doses', to: 'doses#new'
  resources :doses, only: [:destroy]

  # Used for signing up a new user
  get "/signup", to: 'users#new'
  post "/users", to: 'users#create'

  # Used for logging in and out
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get '/logout', to: 'sessions#destroy'
end
