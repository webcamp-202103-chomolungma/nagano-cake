Rails.application.routes.draw do
  
  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/sessions',
    registrations: 'admin/registrations',
    password: 'admin/passwords'
  }
  
    devise_for :customers, controllers: {
    :sessions => 'customers/sessions',
    :registrations => 'customers/registrations'
  }
  
  root 'homes#top'
  namespace :admin do
    root 'homes#top'
  end
  
  get 'home/about'=>'homes#about'
  get 'customers/my_page'=>'customers#show'
  get 'customers/edit/:id'=>'customers#edit'
  get 'customers/unsubscribe'=>'customers#unsubscribe'
  patch 'customers/withdraw'=>'customers#withdraw'

  # devise_for :customers
  # root to: 'homes#top'

  
 resources :customers, only: [:show, :edit, :update]

  # resources :customers, only: [:show, :edit, :update]


  # devise_for :admin, controllers: {
  # sessions: "admin/sessions"
  # }
  # namespace :admin do
  #   resources :admin, only: %i(index destroy)
  # end

  # devise_for :admin, controllers: {
  #   sessions: 'admin/sessions'
  # }
  # get 'customers/unsubscribe'=>'customers#unsubscribe'
  # get 'customers/my_page'=>'customers#show'
  # get 'customers/edit/:id'=>'customers#edit'
  # patch 'customers/unsubscribe'=>'customers#unsubscribe'
  # patch 'customers/withdraw'=>'customers#withdraw'

  namespace :admin do
    resources :customers, only: [:index,:show, :edit, :update]
  end

  resources :orders, only: [:new, :index, :show, :confirm, :thanks, :create]
   namespace :admin do
    resources :orders, only: [:show, :update, :index]
   end

  resources :products, only:[:index, :show,]

  namespace :admin do
    resources :products, only:[:index, :new, :create, :show, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :order_details, only:[:update]
  end

  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  # resources :registrations, only:[:new, :create]
  # resources :sessions, only:[:new, :create, :destroy]
  
###以下カート機能
  # resource :carts, only: [:show]
  # post '/add_item' => 'carts#add_item'
  # post '/update_item' => 'carts#update_item'
  # delete '/delete_item' => 'carts#delete_item'
###以上カート

end