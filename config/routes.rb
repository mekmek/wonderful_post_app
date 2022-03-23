Rails.application.routes.draw do
  devise_for :users
  resources :articles
  root to: 'articles#index'
  get '/mypage', to: 'mypage#show'
end
