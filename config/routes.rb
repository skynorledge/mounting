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
  end

  namespace :public do
    resources :items, only: [:show,:index]
  end

end
