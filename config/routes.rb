Rails.application.routes.draw do
  use_doorkeeper

  resources :comments, only: [:create, :show, :destroy] 
  
  resources :events, shallow: true do
  	resources :comments, only: [:index, :create], module: 'events'
  end

  resources :users, only: [:index, :show, :update, :destroy]
  
  post 'registrations', to: 'registrations#create'

  resources :notifications

  resources :euvous

  resources :reports

  resources :categories, only: [:index, :show ]
end
