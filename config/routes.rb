Rails.application.routes.draw do
  resources :reports
  resources :attends
  resources :comments
  resources :addresses
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
