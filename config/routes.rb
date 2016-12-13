Rails.application.routes.draw do
  
  root 'events#index'

  devise_for :users 
  resources :users do 
    resources :events
    resources :games
  end
  resources :events
end
