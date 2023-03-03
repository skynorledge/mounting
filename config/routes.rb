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


  get '/customers/mypage' => "public/customers#show"

  get '/customers/info/edit' => "public/customers#edit"

  patch '/customers' => 'public/customers#update'

  get '/customers/confirm' => 'public/customers#confirm'

  patch '/customers/withdrawal' => 'public/customers#withdrawal'


  get '/cart_items' => 'public/cart_items#index'

  patch '/cart_items/:id' => 'public/cart_items#update'

  #delete '/cart_items/:id/remove' => "public/cart_items#destroy"

  delete '/cart_items/remove' => "public/cart_items#destroy_all"


  get '/orders/new' => "public/orders#new"

  post '/orders/confirm' => 'public/orders#confirm'

  get '/orders/complete' => "public/orders#complete"

  get '/orders' => "public/orders#index"

  get '/orders/:id' => "public/orders#show"


  get '/deliveries' => "public/deliveries#index"

  get '/deliveries/:id/edit', to: "public/deliveries#edit"

  #patch '/deliveries/:id' => "public/deliveries#update"

  #delete '/deliveries/:id' => "public/deliveries#destroy"


  get '/items' => "public/items#index"

  get '/items/:id' => "public/items#show"


  namespace :admin do
    root to: 'homes#top'
    get '/admin' => "homes#top",as: "admin"
    resources :items, only: [:new,:show,:index,:edit,:create,:update]
    resources :genres, only: [:index,:edit,:create,:update]
    resources :customers, only: [:show,:index,:edit,:update]
    resources :orders, only: [:show,:update]
    resources :order_items, only: [:update]
  end

  namespace :public do
    resources :items, only: [:show,:index]
    resources :customers, only: [:show,:edit,:update]
    resources :cart_items, only: [:update,:index,:destroy,:create]
    resources :orders, only: [:new,:create,:index,:show]
    resources :deliveries, only: [:index,:edit,:create,:update,:destroy]
  end



end
