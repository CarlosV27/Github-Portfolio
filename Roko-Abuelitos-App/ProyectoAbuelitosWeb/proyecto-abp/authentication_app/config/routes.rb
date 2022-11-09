Rails.application.routes.draw do
  
  # for authentication of user's 
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  

  # routes for the doctors
  resources :doctors

  # routes for the pacients
  resources :pacients

  

  
  


  root to: "static#otherHome"
end