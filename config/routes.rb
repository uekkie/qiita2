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

      resources :comments, only: %i(create) do
        resources :likes, only: %i(create destroy), module: :comments
      end
      resources :stocks, only: %i(create destroy)
      resources :likes, only: %i(create destroy), module: :items
    end

  end

  resources :tags , only: %i(show), param: :name do
    resource :follow , only: %i(create destroy), module: :tags
  end

  resource :tagfeed, only: :show
  resource :timeline, only: :show

  resources :relationships, only: %i(create destroy)

  get 'markdown/preview'
end
