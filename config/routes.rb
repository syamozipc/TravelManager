Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
    passwords: 'public/passwords',
    omniauth_callbacks: 'public/omniauth_callbacks'
  }

  scope module: :public do
  	root 'homes#top'
    get 'users/unsubscribe'
    patch 'users/withdraw'
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only:[:create, :destroy]
      member do
        get :follows, :followers
      end
    end
    resources :relationships, only: [:create, :destroy]
    get 'albums/confirm'
    get 'albums/ranking'
    resources :albums do
    	resource :likes, only: [:create, :destroy]
    	resources :comments, only: [:create, :destroy]
      delete 'photos/destroy_all'
    end
  	resources :searches, only: [:index]
    resources :messages, only: [:create, :destroy]
    resources :rooms, only: [:create, :show, :index]
    post 'inquiries/confirm'
    resources :inquiries, only: [:new, :create, :show]
  end

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }

  namespace :admin do
    get 'homes/top'
    resources :destinations, only: [:index, :edit, :update]
    get 'inquiries/completed'
    resources :inquiries, only: [:index, :show, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
