Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }

  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
      resources :resumes
    end
  end

  namespace :account do
    resources :users
  end

  resources :jobs do
    resources :resumes
  end

  root 'welcome#index'
end
