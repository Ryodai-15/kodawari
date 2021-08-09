Rails.application.routes.draw do

  root :to => "public/homes#top"
  get "home/about" => "public/homes#about"

 devise_for :members , :controllers => {
     :sessions => 'public/members/sessions',
     :registrations => 'public/members/registrations'
  }

  scope module: :public do
    resources :members, only: [:show, :edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
  end

end
