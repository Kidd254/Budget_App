Rails.application.routes.draw do
  devise_for :users
  resources :categories, only: [:index, :show, :new, :create]
  root "categories#index"
  resources :payments, only: [:index, :new, :create]
end
