Rails.application.routes.draw do

  root 'cocktails#index'

  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end

  get 'cocktails/:cocktail_id/doses', to: 'doses#new'
  resources :doses, only: [:destroy]
end
