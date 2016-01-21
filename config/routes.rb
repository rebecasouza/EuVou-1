Rails.application.routes.draw do
	root 'events#index'
  resources :events
 # resources :users


	#match "/profile/:id/show" => "users#show", :as => 'show',via: [:get, :patch]
	match '/profile/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
	match '/profile/:id' => 'users#user_show', via: [:get, :patch], :as => :user_show


 #match '/users/:id',   to: 'users#show',  via: 'get'
	devise_for :users, :controllers => { registration: 'registration' ,omniauth_callbacks: 'omniauth_callbacks' }

	#match '/profile/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :show_user



  #devise_for :users,
       #:controllers => { :sessions => 'devise/sessions'},
       #  :skip => [:sessions] do

			# get '/show' => "devise/registrations#show", :as => :new_user_session

     # get '/login' => "devise/sessions#new", :as => :new_user_session
     # post '/login' => 'devise/sessions#create', :as => :user_session
      # get '/signout' => 'devise/sessions#destroy', :as => :destroy_user_session
      # get '/signup' => 'devise/registrations#new', :as => :new_user_registration
    	#get 'edit' => 'devise/registrations#edit', :as => :edit_user_registration_path

 # end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
