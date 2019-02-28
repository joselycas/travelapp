Rails.application.routes.draw do
  #get '/signin' => 'sessions#new'
  #post '/signin' => 'sessions#signin'
   delete '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :trips
  end

  resources :destinations
  resources :activities




  root 'welcome#home'


end
