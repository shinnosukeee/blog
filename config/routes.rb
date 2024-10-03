
Rails.application.routes.draw do
  devise_for :admin_users
  resources :articles
  root to: 'articles#index'
end