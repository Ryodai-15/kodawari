Rails.application.routes.draw do

  root :to => "public/homes#top"
  get "home/about" => "public/homes#about"

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
