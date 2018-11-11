Rails.application.routes.draw do
  # Public Routes
  root 'cards#index'
  get 'cards/:id' => 'cards#show', as: :card

  # RasPi Routes
  post 'pumps' => 'pumps#create'

  # Admin Routes

  # To be removed routes
  get 'data' => 'viewer#index', as: :viewer

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
