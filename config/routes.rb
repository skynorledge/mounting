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

  resources :admin, only: [:new,:create,:index,:show,:edit,:update,:destroy]
  resources :customer, only: [:show, :edit, :update,:index,:destroy]
end
