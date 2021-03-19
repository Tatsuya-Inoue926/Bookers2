Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get "home/about", to: "homes#about"
  post "users/:id", to: "books#show"
  resources :books
  resources :users, only: [:index, :show, :update, :edit]
end
