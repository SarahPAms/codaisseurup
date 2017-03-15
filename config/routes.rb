Rails.application.routes.draw do
  resources :categories
  root to: "pages#home"


  devise_for :users

  resources :user, only: [:show]
  resources :events
  resources :profiles, only: [:new, :edit, :create, :update]

  get "about" => "pages#about"
end
