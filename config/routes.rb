Rails.application.routes.draw do
  devise_for :users
  resources :categories, only: [:index, :show]
  root "categories#index"
  resources :payments, only: [:index, :new, :create]
end
