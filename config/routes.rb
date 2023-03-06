Rails.application.routes.draw do

  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords] ,controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: 'homes#top'

  get '/about' => "homes#about",as: "about"


  scope module: :public do

  #root to: 'homes#top'


  get '/customers/mypage' => "customers#show"

  get '/customers/info/edit' => "customers#edit"

  #patch '/customers' => 'customers#update'

  get '/customers/confirm' => 'customers#confirm'

  patch '/customers/withdrawal' => 'customers#withdrawal'


  #get '/cart_items' => 'cart_items#index'

  #patch '/cart_items/:id' => 'cart_items#update'

  #delete '/cart_items/:id/remove' => "cart_items#destroy"

  delete '/cart_items/remove' => "cart_items#destroy_all"


  #get '/orders/new' => "orders#new"

  post '/orders/confirm' => 'orders#confirm'

  get '/orders/complete' => "orders#complete"

  #get '/orders' => "orders#index"

  #get '/orders/:id' => "orders#show"


  #get '/deliveries' => "deliveries#index"

  #get '/deliveries/:id/edit' => "deliveries#edit"

  #patch '/deliveries/:id' => "deliveries#update"

  #delete '/deliveries/:id' => "deliveries#destroy"

  resources :items, only: [:show,:index]
  resources :customers, only: [:show,:edit,:update]
  resources :cart_items, only: [:update,:index,:destroy,:create]
  resources :orders, only: [:new,:create,:index,:show]
  resources :deliveries, only: [:index,:edit,:create,:update,:destroy]

  end


  namespace :admin do
    root to: 'homes#top'
    get '/admin' => "homes#top",as: "admin"
    resources :items, only: [:new,:show,:index,:edit,:create,:update]
    resources :genres, only: [:index,:edit,:create,:update]
    resources :customers, only: [:show,:index,:edit,:update]
    resources :orders, only: [:show,:update]
    resources :order_items, only: [:update]
  end



end
