Rails.application.routes.draw do
  root :to => "home#index"

  get '/about', to: 'static_pages#about'

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  resources :books do

  	collection do
      get 'active'
    end
    
  	resources :comments
  end


  resources :categories


end