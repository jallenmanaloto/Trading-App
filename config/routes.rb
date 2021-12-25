Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  get 'index', to: 'markets#index'
  get 'search', to: 'markets#search'
  devise_for :users, controllers: { registrations: 'users/registrations' }, views: { registrations: 'users/new' }

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :traders do
          patch :buy_stock, on: :member
          resources :stocks
        end
        resources :admins
      end
    end
  end
end
