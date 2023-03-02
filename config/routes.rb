Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:show, :index, :edit, :update]
  end

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

  get '/items' => 'public/items#index'
  get '/items/:id' => 'public/items#show'

  get '/cart_items' => 'cart_items#index'
  patch '/cart_items/:id' => 'cart_items#update'
  post '/cart_items' => 'cart_items#create'

  get '/customers/my_page' => 'public/customers#show', as: 'my_page'
  get '/customers/information/edit' => 'public/customers#edit'
  patch '/customers/information' => 'public/customers#update'
  get '/customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe'
  patch '/customers/withdrawal' => 'public/customers#withdrawal', as: 'withdrawal'

  get '/orders/new' => 'orders#new'
  post '/orders' => 'orders#create'
  post '/orders/confirm' => 'orders#confirm'
  get '/orders/complete' => 'orders#complete'
  get '/orders' => 'orders#index'
  get '/orders/:id' => 'orders#show'

  resources :addresses, only:[:index, :edit, :create, :update, :destroy]
end
