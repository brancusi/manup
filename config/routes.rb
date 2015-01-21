Rails.application.routes.draw do


	
	api_version(:module => "V1", 
		:header => {:name => "0.0.1", :value => "0.0.1"}, 
		:defaults => {:format => :json}, 
		:path => {:value => "v1"}, 
		:default => true) do
		
		resources :contacts, except: [:new, :edit]
	
		# devise_for :users
	end
	

  
	# namespace :api, :defaults => {:format => :json} do
	# 	namespace :v1 do
	# 		resources :contacts, except: [:new, :edit]
	# 		resources :ingredients, except: [:new, :edit]
	# 		resources :items, except: [:new, :edit]
	# 		resources :item_nodes, except: [:new, :edit]
	# 		resources :recipes, except: [:new, :edit]
	# 		resources :products, except: [:new, :edit]

	# 	end
	# end

end