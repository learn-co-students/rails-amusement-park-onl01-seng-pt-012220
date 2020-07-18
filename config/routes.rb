Rails.application.routes.draw do
  root 'static#home'
    get '/signin', to: 'sessions#new'
    post '/session', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'
    delete '/session/', to: 'session#destroy'

    resources :users, only: [:new, :create, :show, :edit, :update]
    resources :attractions, only: [:index, :create, :show, :new, :edit, :update]
    resources :rides, only: [:create]
end
