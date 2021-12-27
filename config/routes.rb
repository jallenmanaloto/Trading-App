Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'api/v1/users#index'
  get 'index', to: 'markets#index'
  get 'search', to: 'markets#search'
  get 'api/v1/users/:user_id/traders/:trader_id/stock_quantity', to: 'api/v1/stocks#stock_quantity'
  # patch 'api/v1/users/:user_id/traders/:trader_id/sell_stock', to: 'api/v1/traders#sell_stock'
  devise_for :users, controllers: { registrations: 'users/registrations' }, views: { registrations: 'users/new' }

  namespace :api do
    namespace :v1 do
      resource :markets
      resources :users do
        resources :traders do
          patch :buy_stock, on: :member
          patch :sell_stock, on: :member
          resources :histories
          resources :stocks
        end
        resources :admins
      end
    end
  end
end
