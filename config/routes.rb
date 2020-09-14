Rails.application.routes.draw do
  resources :tasks
  devise_for :users

  authenticated :user do
    root to: 'projects#index', as: :authenticated_root
  end

  resources :projects do
    resources :notes
    resources :tasks do
      member do
        post :toggle
      end
    end
  end

  namespace :api do
    resources :projects
  end

  root "home#index"
end
