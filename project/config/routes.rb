Rails.application.routes.draw do
  
  resources :lists
  root 'static_pages#home'
  get 'products/create'
  get 'products/update'
  get 'products/destroy'

  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/clear'
  get 'order_items/destroy'

  get 'carts/show'
  get 'carts/checkout'

  get 'products/index'
  get 'sessions/new'
  get 'users/new'

  get  '/help', to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
 get '/uc', to: 'comments#userindex'
  post '/search', to: 'users#search'

  post '/search2', to: 'products#search2'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

   resources :products, only: [:update, :index, :create, :new, :destroy, :edit,:show] do
	resources :comments
   end
   resource :cart, only: [:show, :checkout]
   resources :order_items, only: [:create, :update, :destroy]

  resources :users do
  resources :comments
  end




end
