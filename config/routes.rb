Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :traders
        resources :admins
      end
    end
  end
end
