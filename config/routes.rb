Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/events' => 'events#index'
  get '/events/show/:id' => 'events#show', as: :event
  get '/events/new' => 'events#new'
  post 'events' => 'events#create'
  post '/events/attend' => 'events#attend'

  get '/users' => 'users#index'
  get '/users/show/:id' => 'users#show', as: :user
  get '/users/new' => 'users#new'
  post 'users' => 'users#create'
  get '/users/log_in' => 'users#log_in'
  post '/users/log_in' => 'users#log_in_user'
  delete '/users/log_out' => 'users#log_out'
  
  root "events#index"
end
