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

  namespace :admin do
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
