Rails.application.routes.draw do

  root to: "subs#index"

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :subs
  resources :links do
    resources :comments, only: [:new, :create]
  end

  resources :comment, only: [:destroy]



end
