Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users, only: [:show]
  resources :doctors do
    resources :reviews, only: [:create, :destroy]
  end
  root to: 'pages#home'
  get "about", to: "pages#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, only: [:show] do
    member do                             # doctor id in URL
      get 'match', to: "doctormatches#index"
      patch 'match', to: "doctormatches#status"
    end

  end

end
