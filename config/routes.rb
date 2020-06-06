Rails.application.routes.draw do
  get 'tasks/new'
  get 'tasks/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]
  resources :tasks, only: %i[index new create]
  root 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
