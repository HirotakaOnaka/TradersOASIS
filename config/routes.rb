Rails.application.routes.draw do
  root "charts#index"

  get 'charts/top'
  get 'charts/index'

  devise_for :users
  
  resources :users, :only => [:index, :show] do
    member do
      get :favorites
      get :usefuls
    end
  end

  resources :notes do
  end
    
  resources :trading_methods do
    resources :favorites, only: [:create, :destroy]
    resources :usefuls, only: [:create, :destroy]
  end
  resources :unusefuls, only: [:create, :destroy]
  
  mount Ckeditor::Engine => '/ckeditor'

end
