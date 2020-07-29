Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
    passwords: 'public/passwords'
  }

  scope module: :public do
  	root 'homes#top'
    get 'users/unsubscribe' #退会確認画面
    patch 'users/withdraw'  #退会アクション
    resources :users, only: [:show, :edit, :update]
    resources :relationships, only: [:create, :destroy]
    get 'albums/confirm' #album削除確認画面
    get 'albums/ranking' #いいねランキング
    resources :albums do
    	resource :like, onlly: [:create, :destroy]
    	resources :comments, only: [:create, :destroy]
      delete 'photos/destroy_all'
    	resources :photos, only: [:create, :destroy]
    end
  	get 'searches/index'
  end

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }

  namespace :admin do
    get 'homes/top'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
