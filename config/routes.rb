Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'

  resources :sessions, only: [:create]

  resources :users, only: [:create]

  resources :tweets

  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get '/signup' => 'users#new'
end
