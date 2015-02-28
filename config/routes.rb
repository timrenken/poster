Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'registrations'}
  root 'pages#index'

  resources :posts, only: [:create, :destroy]
  
  resources :users, only: [:show, :index] do
    member do
      get :following, :followers
    end
  end
 
end
