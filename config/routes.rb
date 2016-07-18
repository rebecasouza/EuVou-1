Rails.application.routes.draw do
  #use_doorkeeper

  resources :comments, only: [:show, :destroy] 
  
  resources :events, shallow: true do
  	resources :comments, only: [:index, :create], module: 'events'
  end

  resources :users

  resources :notifications

  resources :euvous

  resources :reports

  resources :categories
end
