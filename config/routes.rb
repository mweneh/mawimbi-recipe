Rails.application.routes.draw do
  resources :recipes
  resources :users, except: [:crete]
  # sessions
  post '/login', to:'sessions#login'
  delete '/logout', to: 'sessions#logout'

  # users
  get '/me', to: 'users#show_me'
  post '/signup', to: 'users#create'
end
