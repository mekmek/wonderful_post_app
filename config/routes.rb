Rails.application.routes.draw do
  devise_for :users
  resources :sample_articles
  resources :articles
  root to: 'articles#index'
  get '/mypage', to: 'mypage#show'
end
