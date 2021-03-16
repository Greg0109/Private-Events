Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/events' => 'events#index'
  get '/events/:id' => 'events#show', as: :event
  get '/users' => 'users#index'
  get '/users/show' => 'users#show'
  get '/users/new' => 'users#new'
  post 'users' => 'users#create'
  delete '/users/logout' => 'users#logout'
  root "events#index"
end
