Rails.application.routes.draw do
	root 'accounts#index'
	resources :accounts
	get 'about' => 'static_pages#about'
	get 'random' => 'static_pages#random'
	get 'add' => 'static_pages#add'
end
