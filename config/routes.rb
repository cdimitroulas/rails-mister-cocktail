Rails.application.routes.draw do

  root to: 'cocktails#index'

  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end
  # Destroy route for doses
  resources :doses, only: [:destroy]

  # This route prevents program crashing if user reloads the page
  # on the doses#new form after making a mistake
  get 'cocktails/:cocktail_id/doses', to: 'doses#new'


  # Routes for current user to allow editing of their own cocktails
  namespace :current_user do
    resources :cocktails, only: [:edit, :update, :destroy]
  end

  # Used for signing up a new user
  get "/signup", to: 'users#new'
  post "/users", to: 'users#create'

  # Used for logging in and out
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get '/logout', to: 'sessions#destroy'

  # Extra routes/filters/dashboard etc.
  get "/dashboard", to: "cocktails#dashboard"
end
