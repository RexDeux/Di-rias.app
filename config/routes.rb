Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "restaurants#opener"

  resources :restaurants do
    resources :menus do
      resources :dishes
    end
  end

  authenticate :user, ->(u) { u.admin? } do
    get '/admin', to: 'admin#index', as: :admin_dashboard
  end  
  
  namespace :admin do
    get 'users/index'
    get 'users/edit'
    get 'users/update'
    get 'users/destroy'
    get 'dashboard/index'
    resources :users, only: [:index, :edit, :update, :destroy]
    get 'dashboard', to: 'dashboard#index'
  end
end
