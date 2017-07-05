Rails.application.routes.draw do
  root 'categories#index'

  resources :categories do
    resources :products
  end
end
