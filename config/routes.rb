Rails.application.routes.draw do
   # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :orders, only: [:show, :update]
    root to: "homes#top"
    get 'homes/about' => 'homes#about'
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  # 管理者
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  namespace :admin do
    # get 'genres/index'
    # get 'genres/edit'
    resources :genres, only: [:index, :create, :edit, :update]
  end

  # 顧客
  scope module: :public do
    resources :items, only: [:index, :show]
    root to: "homes#top"
    get 'homes/about' => 'homes#about'

    resources :customers, only: [:edit, :update, :withdrawal, :destroy]
    get '/customers/my_page' => 'customers#show'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdrawa'

    resources :orders, only: [:new, :index, :show, :create, :confirm]
    get 'orders/complete' => 'orders#complete'

    resources :cart_items, only: [:index, :create, :update, :destroy, :destroy_all]

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
