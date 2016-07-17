Rails.application.routes.draw do

	get '/events/:event_id/attends' => 'attends#index'

  post '/events/:attended_event_id/attend' => 'attends#create' 

  delete '/events/:attended_event_id/cancel_attend' => 'attends#destroy' 
	
	get '/events/:event_id/reports' => 'reports#index'
  
  post '/events/:reported_event_id/report' => 'reports#create' 

	delete '/events/:reported_event_id/cancel_report' => 'reports#destroy'

  resources :comments
  
  resources :events
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
