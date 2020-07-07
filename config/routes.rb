Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :attractions
root 'users#welcome'
get '/signup' => 'users#new'
get '/signin' => 'users#signin', as: 'login'
post '/signin' => 'users#login'
get '/logout' => 'users#logout', as: 'logout'
post '/attractions/new' => 'attractions/new'
post '/ride' => 'attractions#ride' 
end
