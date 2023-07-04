Rails.application.routes.draw do
  resources :recipes
  resources :users
  post '/signup', to: 'users#create'
 # post '/login', to: 'users#create'
end
