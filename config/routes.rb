Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'posts#index'

  resources :posts do
    resources :post_likes
    resources :comments do
      resources :comment_likes
    end
  end

  post '/registration', to: 'users#create'
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'
end
