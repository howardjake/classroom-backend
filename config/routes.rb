Rails.application.routes.draw do
  resources :assignment_masters
  resources :courses
  resources :students
  resources :assignments

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
