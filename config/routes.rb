Rails.application.routes.draw do
  get 'customers/index'

  # get 'welcome/index'

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers
end
