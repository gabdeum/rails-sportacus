Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get "/account", to: "pages#account"
  get "/articles/new/characteristic", to: "articles#new_characteristic"
  get "/articles/:id/edit/characteristic", to: "articles#edit_characteristic", as: "articles_edit_characteristic"
  resources :articles do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:show]
end
