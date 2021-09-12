Rails.application.routes.draw do
  root to: 'sessions#home'
  post 'login', to: 'sessions#create'
  
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
    resources :reviews, only: [:index, :new, :create]
    resources :courses, only: [:index, :new, :create]
  end
  
  
  resources :courses do
    resources :reviews, only: [:index, :new, :create]
  end
  
  resources :reviews, only: [:index, :create]

  resources :registrations, only: [:create, :destroy]

  scope '/admin' do
    resources :departments
    resources :users, only: [:index], as: 'admin_users'
    get 'courses/past', to: 'courses#past', as: 'past_courses'
    get 'courses/pending', to: 'courses#pending', as: 'pending_courses'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
