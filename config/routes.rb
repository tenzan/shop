Rails.application.routes.draw do
  namespace :admin do
    root "application#index"

    resources :categories, only: [:new, :create, :edit, :update, :destroy]
  end

  devise_for :users
  root 'categories#index'

  resources :categories, only: [:index, :show] do
    resources :products
  end
end
