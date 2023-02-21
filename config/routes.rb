Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  namespace :admin do
    resources :items, except[:destroy]
    resources :genres, only[:index, :create, :edit, :update]
    resources :sessions, only[:new, :create, :destroy]
    resources :customers, only[:show, :index, :edit, :update]
  end
end
