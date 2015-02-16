Rails.application.routes.draw do

	api_version(:module => "V1", 
				:header => {:name => "0.0.1", :value => "0.0.1"}, 
				:defaults => {:format => :json}, 
				:default => true) do
    
		resources :users, except: [:new, :edit]
		resources :access_tokens, only: [:create]
		
	end

end