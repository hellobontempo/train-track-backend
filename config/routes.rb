Rails.application.routes.draw do
  resources :program_exercises
  resources :programs
  resources :exercises
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
