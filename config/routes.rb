Rails.application.routes.draw do
  # get 'groups/new'
  # get 'groups/index'
  # get 'groups/create'
  # get 'new/create'
  # get 'new/index'
  # get 'tasks/new'
  # get 'tasks/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]
  resources :tasks, only: %i[index new create]
  resources :groups, only: %i[index new create show]
  root 'users#profile'
  get 'externals_task', to: 'tasks#externals'
  get 'managing_employees', to: 'managers#employees'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
