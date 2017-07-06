Rails.application.routes.draw do
  namespace :admin do
    root "application#index"
  end

  devise_for :users
  root 'categories#index'

  resources :categories do
    resources :products
  end
end
