Rails.application.routes.draw do
  root 'user_programs#index'
  resources :cross_train_exercise_preferences
  resources :custom_programs
  resources :user_programs
  resources :program_exercises
  resources :programs
  resources :exercises
  # resources :users, only: [:create]
  post '/signup', to: 'users#create'
  post '/login', to: 'auth#create'
  get '/auto_login', to: 'auth#auto_login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
