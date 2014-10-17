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
  end

  resources :movies do
    resources :comments
  end

  resources :categories

  resources :microposts

  resources :relationships, only: [:create, :destroy]

end