Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get 'auth/facebook/callback', to: "sessions#create"
  delete 'sign_out', to: "sessions#destroy", as: "sign_out"
end
