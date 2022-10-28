Rails.application.routes.draw do
  resources :users
  # sessions
  post '/login', to:'sessions#login'
  delete '/logout', to: 'sessions#logout'

  # users
  get '/me', to: 'users#show_me'
end
