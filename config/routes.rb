Rails.application.routes.draw do
  root to: 'sessions#home'
  post 'login', to: 'sessions#create'
  
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  delete 'logout', to: 'sessions#destroy'
  resources :users do
    resources :reviews, only: [:index, :new, :create]
    resources :courses, only: [:index, :new, :create]
  end
  
  get 'courses/past', to: 'courses#past', as: 'past_courses'

  resources :courses do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :registrations, only: [:create, :destroy]
  resources :reviews
  scope '/admin' do
    resources :departments
    resources :users, only: [:index], as: 'admin_users'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
