Rails.application.routes.draw do
  devise_for :admins
  # Public Routes
  root 'cards#index'
  get 'search' => 'cards#search', as: :card_search
  get 'cards' => 'cards#show', as: :card

  # RasPi Routes
  post 'pumps' => 'pumps#create'

  # Admin Routes

  # To be removed routes
  get 'data' => 'viewer#index', as: :viewer

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
