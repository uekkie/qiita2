Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users

  resources :users, :except => [:index] do
    resources :items do
      resources :comments
    end
  end
end
