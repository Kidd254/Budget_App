Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'users/sessions/registrations'
  }
  
  get 'landing', to: 'welcome#landing'
  resources :categories, only: [:index, :show, :new, :create]
  resources :payments, only: [:index, :new, :create]
  root "welcome#landing"
end
