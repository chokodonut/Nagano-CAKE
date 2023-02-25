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

  get '/customers/my_page' => 'customers#show', as: 'customers_my_page'
  get '/customers/information/edit' => 'customers#edit'
  patch '/customers/information' => 'customers#update'
  get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'customers_unsubscribe'
  patch '/customers/withdrawal' => 'customers#withdrawal', as: 'customers_withdrawal'

end
