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
  get '/items/:id' => 'public/items#show', as: 'item'

  delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'

  get '/cart_items' => 'public/cart_items#index'
  post '/cart_items' => 'public/cart_items#create'
  patch '/cart_items/:id' => 'public/cart_items#update', as: 'cart_item_update'
  delete '/cart_items/:id' => 'public/cart_items#destroy', as: 'cart_item_destroy'

  get '/customers/my_page' => 'public/customers#show', as: 'my_page'
  get '/customers/information/edit' => 'public/customers#edit'
  patch '/customers/information' => 'public/customers#update'
  get '/customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe'
  patch '/customers/withdrawal' => 'public/customers#withdrawal', as: 'withdrawal'

  get '/orders/new' => 'public/orders#new'
  post '/orders' => 'public/orders#create'
  post '/orders/confirm' => 'public/orders#confirm'
  get '/orders/complete' => 'public/orders#complete'
  get '/orders' => 'public/orders#index'
  get '/orders/:id' => 'public/orders#show'

  scope module: :public do
  resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end
end
