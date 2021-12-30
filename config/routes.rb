Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'api/v1/users#index'
  get 'index', to: 'markets#index'
  get 'search', to: 'markets#search'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }, views: { registrations: 'users/new' }

  namespace :api do
    namespace :v1 do
      resource :markets
      resources :users do
        resources :traders do
          get :all_stocks, on: :member
          patch :buy_stock, on: :member
          patch :sell_stock, on: :member
          patch :deposit_money, on: :member
          resources :histories
          resources :stocks do
            get :sell_stock, on: :member
            post :buy_stock, on: :member
          end
        end
        resources :admins do
          patch :approve_account, on: :member
        end
      end
    end
  end
end
