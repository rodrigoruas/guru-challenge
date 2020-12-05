Rails.application.routes.draw do
  resources :playlists
  root "playlists#index"
  # post '/auth/callback', to: 'sessions#create'
  get '/callback', to: "sessions#create"

  get 'login', to: redirect("#{ENV["API_DOMAIN"]}authorize?response_type=code&client_id=#{ENV["API_CLIENT_ID"]}&redirect_uri=#{ENV["API_CALLBACK_URL"]}&scope=openid%20profile%20email&state=YOUR_STATE_VALUE")
  
  post 'subscriptions', to: "users#update_subscription"
  
 
  # get 'auth/auth0/callback' => 'auth0#callback'
  # get 'auth/failure' => 'auth0#failure'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
