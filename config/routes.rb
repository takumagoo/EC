Rails.application.routes.draw do
  # 管理者
  # namespace :admin do
  #   resources :genres, only: [:index, :new, :create, :show, :edit, :update]
  # end
  # 管理者
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  # 顧客
  namespace :public do
    resources :items, only: [:index, :show]
  end

  namespace :admin do
    # get 'genres/index'
    # get 'genres/edit'
    resources :genres, only: [:index, :create, :edit, :update]
  end
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
