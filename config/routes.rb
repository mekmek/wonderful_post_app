Rails.application.routes.draw do
  resources :sample_articles
  resources :articles
  root to: 'articles#index'
end
