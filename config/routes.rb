Forum3::Application.routes.draw do

  #devise_for :admin
  
  namespace :admin do 
    resources :forums
    resources :users
  end
 
  resources :forums, :only => [:show] do
    collection do
    end
    member do
    end
  end

  resources :shouts, :only => [:show,:create,:destroy] do
    collection do
    end
    member do
      get 'nix'
      get 'mood'
    end
  end
  
  root :to => "site#index"

end
