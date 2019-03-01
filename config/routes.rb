Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
   get '/logout' => 'sessions#destroy'
   delete '/logout' => 'sessions#destroy'
  #get '/auth/facebook/callback' => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :trips do
    resources :destinations
  end
  resources :activities




  root 'welcome#home'


end
