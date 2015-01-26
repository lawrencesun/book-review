Rails.application.routes.draw do
  root :to => "home#index"

  get '/about', to: 'static_pages#about'

  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :books do
  	collection do
      get 'active'
    end
    
  	resources :comments
    resources :posts
  end

  resources :topics do
    collection do
      get 'active'
    end
    
    resources :comments
    resources :posts
  end

  resources :movies do
    resources :posts
    resources :comments
  end

  resources :posts do 
    resources :comments
  end

  resources :categories

  resources :microposts

  resources :relationships, only: [:create, :destroy]

end