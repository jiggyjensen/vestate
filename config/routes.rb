Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: 'pages#home'
  resources :properties, only: [:new, :create, :index, :show] do
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

  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
