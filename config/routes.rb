Lunchville::Application.routes.draw do
  resources :users
  resources :proposals
  resources :orders
  
  resources :lunches do
    member do
      post :vote
    end
  end
  
  resources :restaurants do
    member do
      post :rate
    end
  end
end
