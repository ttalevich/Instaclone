Rails.application.routes.draw do
	# See the posts, delete the posts, all posts .etc
	resources :posts
	
	root 'posts#index'
	get "/posts/:id" => "posts#show"
  

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: "home#index"
end
