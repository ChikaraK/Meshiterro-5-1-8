Rails.application.routes.draw do
  get 'users/show'
  root 'post_images#index'
  devise_for :users
  resources :post_images,only:[:new, :index, :show, :create] do
   	resource :post_comments,only:[:create, :destroy]
  end
  resources :post_images,only:[:new, :create, :index, :show] do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only:[:create, :destroy]
  end
  resources :post_images,only:[:new,:create,:index,:show,:destroy] do
    resource :favorites,only:[:create, :destroy]
    resource :post_comments,only:[:create,:destroy]
  end
  resources :users, only:[:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
