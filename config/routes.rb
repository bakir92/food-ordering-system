Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, except: [:destroy]
  resources :order_items
  resources :orders
  resource :carts
  resources :items, except: [:destroy]
  resources :users, except: [:new]
  get 'welcome/home', to: 'welcome#home'
  get 'welcome/about', to: 'welcome#about'
  get 'signup', to: 'users#new'

  get 'checkout' => 'orders#checkout', as: 'checkout'

  root 'welcome#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
