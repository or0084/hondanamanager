Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  devise_scope :user do
    post 'user/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end


  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }


  root :to => "public/homes#top"


  scope module: :public do
    resources :books, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :book_comments, only: [:create, :destroy]
    end

    get 'search' => 'books#search'
    get 'users/mypage' => 'users#show', as: 'mypage'
    get 'users/mypage/edit' => 'users#edit', as: 'edit'
    patch 'users/mypage' => 'users#update', as: 'user'
    get '/users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch '/users/withdraw' => 'users#withdraw', as: 'withdraw'
  end


  namespace :admin do
    resources :users, only:[:index, :show, :edit, :update, :destroy]

    resources :books, only:[:index, :show, :destroy] do
      resources :book_comments, only: [:destroy]
    end

    resources :genres, only:[:index, :create, :edit, :update]
    
    get 'search' => 'books#search'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
