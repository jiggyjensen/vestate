Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: 'pages#home'
  resources :properties, only: [:new, :create, :index, :show] do
    resources :likes, only: [:create, :destroy]
    resources :investments, only: [:new, :create]
  end
  get '/home-developers', to: 'pages#home_developers', as: :home_developers # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dashboards, only: [:index]

  resources :orders, only: [:show, :create] do
     resources :payments, only: [:new]
   end
  resources :investments, only: [] do
    resources :orders, only: [:new]
  end


  patch '/accept-investor/:id', to: 'users#accept_investor', as: :accept_investor
  patch '/reject-investor/:id', to: 'users#reject_investor', as: :reject_investor

  patch '/accept-developer/:id', to: 'users#accept_developer', as: :accept_developer
  patch '/reject-developer/:id', to: 'users#reject_developer', as: :reject_developer

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
