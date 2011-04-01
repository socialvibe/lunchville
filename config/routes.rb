Lunchville::Application.routes.draw do
  resources :users
  
  resources :orders
  resources :lunches
  
  resources :proposals do
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
