Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  root to: 'homes#top'
  get 'homes/about' => "homes#about",as: "about"
end
