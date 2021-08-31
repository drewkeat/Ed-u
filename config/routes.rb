Rails.application.routes.draw do
  root to: 'sessions#home'
  get 'sessions/create', as: 'session_create'
  get 'sessions/destroy', as: 'session_destroy'
  resources :reviews
  resources :registrations
  resources :courses
  resources :departments, only: [:index, :show]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
