Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'projects#index', as: :authenticated_root
  end

  resources :projects
  root "home#index"
end
