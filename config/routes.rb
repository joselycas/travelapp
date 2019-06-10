Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
   get '/logout' => 'sessions#destroy'
  

  get '/auth/facebook/callback' => 'sessions#create'
  get '/top_destinations' => 'destinations#top'

  resources :users

  resources :trips do
    resources :destinations
  end
  resources :activities

  root 'welcome#home'



end
