Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'resumes#index'

  resources :resumes
  resources :jobs do
    member do
      post :apply_join
      post :cancel_join
    end
  end
  namespace :account do
    resources :resumes
    resources :jobs
    resources :apply_jobs
  end

end
