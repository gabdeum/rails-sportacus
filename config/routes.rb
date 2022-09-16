Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get "/account", to: "pages#account"
  get "/articles/new/characteristic", to: "articles#new_characteristic"
  resources :articles
end
