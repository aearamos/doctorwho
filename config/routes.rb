Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users, only: [:show]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
