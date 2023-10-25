Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'users/sessions/registrations',
    confirmations: 'users/sessions/confirmations'
  }
  
  devise_scope :user do  # Wrap your routes in a devise_scope block
    get 'landing', to: 'welcome#landing'
    resources :categories, only: [:index, :show, :new, :create]
    resources :payments, only: [:index, :new, :create]
    root "welcome#landing"
    get '/resend_confirmation', to: 'users/sessions/confirmations#resend', as: :resend_confirmation
  end
end
