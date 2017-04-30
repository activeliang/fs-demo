Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  resources :resumes do
    resources :tags
    member do
      post :employ_it
      post :cancel_employ
    end
  end
  resources :jobs do
    resources :cp_products do
      resources :product_labels
    end
    resources :cp_managers
    resources :jb_labels
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

  namespace :admin do
    resources :resumes
    resources :jobs
    resources :dashboard
  end
  get "dash" => "welcome#dash"

end
