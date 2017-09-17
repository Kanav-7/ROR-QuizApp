Rails.application.routes.draw do
  get 'questions/show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :users
  devise_for :users
  # , :controllers => { :omniauth_callbacks => "callbacks" }
  get 'users/:id' => 'users#profile'
  get 'questions/:quiz_type' => 'questions#show'
  post 'questions/:quiz_type' => 'questions#update'
  get 'questions/:quiz_type/reset' => 'questions#reset'  
  get 'leaderboard/:quiz_type' => 'questions#leader'  

  get 'pages/index'
  root to:'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
