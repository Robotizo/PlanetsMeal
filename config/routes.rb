Rails.application.routes.draw do

  resources :boxes
  resources :password_resets

  resources :orders
  resources :line_items do
    member do
      get 'remove'
    end
  end

  resources :carts 
  resources :products

  get '/mealbox' => 'products#mealbox'

  get 'sessions/new'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users


  root to: 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
