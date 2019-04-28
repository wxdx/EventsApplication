Rails.application.routes.draw do
	resources :events
	get "/welcome" => "welcome#index"
	root "events#index"
	#match ':controller(/:action(/:id(.:format)))', :via => :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
