Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :update, :create, :destroy] do 
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end
  resources :artworks, only: [:show, :update, :create, :destroy] do 
    resources :comments, only: [:index] 
  end

  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:index, :create, :destroy]

  # get 'users/', to: 'users#index', as: 'users'
  # get 'users/:id', to: 'users#show', as: 'user'
  # get 'users/:id', to: 'users#edit', as: 'edit_user'
  # get 'users/', to: 'users#new', as: 'new_user'
  # post 'users/', to: 'users#create'
  # patch 'users/:id', to: 'users#update', as: 'update_user'
  # put 'users/:id', to: 'users#update', as: 'put_user'
  # delete 'users/:id', to: 'users#destroy', as: 'delete_user'
end
