Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users , only: %i[index show] do
    member do
      get :following, :followers
    end
    resources :items , except: :index do
      resources :comments, only: %i[create]
    end
  end
end
