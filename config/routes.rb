Rails.application.routes.draw do
	devise_for :users, :controllers => { registrations: 'registrations' }

	resources :projects
	
	get "/showcase" => "projects#index"
	root "home#index"
end
