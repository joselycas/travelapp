Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
   get '/logout' => 'sessions#destroy'
   delete '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'


  resources :users

  resources :trips do
    resources :destinations
  end
  resources :activities




  root 'welcome#home'


end
