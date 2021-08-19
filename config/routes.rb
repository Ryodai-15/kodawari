Rails.application.routes.draw do

  root :to => "public/homes#top"
  get "home/about" => "public/homes#about"
  
  # ゲストログイン機能
  post '/homes/guest_sign_in', to: 'public/homes#guest_sign_in'
   
  devise_scope :member do
    post 'members/guest_sign_in', to: 'public/members/sessions#guest_sign_in'
  end

 devise_for :members , :controllers => {
     :sessions => 'public/members/sessions',
     :registrations => 'public/members/registrations'
  }

  scope module: :public do
    resources :members, only: [:show, :edit, :update] do
      # collectionはidを付与させなくする
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    
    get "members/:id/favorites" => "members#favorites", as: 'member_favorites'
    
    resources :products, only: [:index, :show] do
      resources :recipes do
        resource :favorites, only: [:create, :destroy]
        resources :reviews, only: [:index, :create]
      end
    end
  end
  
  namespace :admin do
    root :to => "homes#top"
    resources :members, only: [:index, :show, :edit, :update]
    resources :products, only: [:new, :create, :index, :show, :edit, :update]
  end
  
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  
end
