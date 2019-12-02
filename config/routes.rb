Rails.application.routes.draw do
  root 'tasks#index'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
end
