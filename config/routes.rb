Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users , only: %i(index show) do
    member do
      get :following, :followers
    end
    resources :items , except: :index do

      resources :comments, only: %i(create)
      resources :stocks, only: %i(create destroy)
    end
  end

  resources :tags , only: %i(show), param: :name do
    resource :follow , only: %i(create destroy), controller: "tags_follow"
  end

  resources :relationships, only: %i(create destroy)

  get 'markdown/preview'
end
