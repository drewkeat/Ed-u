Rails.application.routes.draw do
  root to: 'sessions#home'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :reviews
  resources :registrations, only: [:create, :destroy]
  resources :courses do
    resources :reviews
  end
  resources :departments, only: [:index, :show]
  resources :users do
    resources :reviews 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
