Rails.application.routes.draw do
	devise_for :users, :controllers => { registrations: 'registrations' }

	resources :projects
	
	get "/showcase" => "projects#index", as: 'showcase'
	get "/about" => "pages#about", as: 'about'
	get "/slack" => "pages#slack", as: 'slack'

	root "pages#home"
end
