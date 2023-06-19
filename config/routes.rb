Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "index", to: "home#index"

  root "home#index"

  get "articles/new", to: "articles#new"
  post "articles", to: "articles#create"
  get "articles", to: "articles#index"
  get "articles/:id", to: "articles#show", as: :article
  get "articles/:id/edit", to: "articles#edit", as: :article_edit
  patch "articles/:id", to: "articles#update"
  delete "articles/:id", to: "articles#destroy"

end
