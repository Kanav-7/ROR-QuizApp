Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :users
  devise_for :users
  # , :controllers => { :omniauth_callbacks => "callbacks" }
  get 'users/:id' => 'users#profile'
  get 'pages/index'
  root to:'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
