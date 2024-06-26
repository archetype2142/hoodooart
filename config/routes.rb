Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products, only: %i[show index]

  root 'static_pages#homepage'

  namespace :admin do
    # Add dashboard for your models here
    resources :products do
      delete :images, on: :member, action: :destroy_image
    end

    resources :categories do
      delete :images, on: :member, action: :destroy_image
    end

    resources :users
    resources :user_products

    root to: "products#index"
  end

  get 'about', to: 'static_pages#about_us'
  get 'contact', to: 'static_pages#contact_us'
  get 'home', to: 'static_pages#homepage'
  put 'modify-product', to: 'cart#modify_product'
  get 'cart', to: 'cart#show'
  delete 'destroy-product', to: 'cart#destroy_product'
  post 'contact', to: 'contact#create'

  get "up" => "rails/health#show", as: :rails_health_check
end
