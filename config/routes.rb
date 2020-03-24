Rails.application.routes.draw do
  get 'investments/new'
  get 'investments/create'
  get 'properties/new'
  get 'properties/create'
  get 'properties/index'
  get 'properties/show'
  devise_for :users
  root to: 'pages#home'
  resources :properties, only: [:new, :create, :index, :show] do
    resources :investments, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
