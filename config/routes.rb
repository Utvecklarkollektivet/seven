Rails.application.routes.draw do
	devise_for :users, :controllers => { registrations: 'registrations' }

	resources :projects
	
	get "/showcase" => "projects#index", as: 'showcase'
	root "home#index"
end
