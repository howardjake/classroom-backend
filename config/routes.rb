Rails.application.routes.draw do
  resources :assignment_masters
  resources :courses
  resources :students
  resources :assignments

  get '/dashboard', to: 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
