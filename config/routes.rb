Rails.application.routes.draw do
  root to: 'sessions#home'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :reviews, except: [:new]
  post 'reviews/new', to: 'reviews#new', as: 'new_review'
  resources :registrations, only: [:create, :destroy]
  resources :courses
  resources :departments, only: [:index, :show]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
