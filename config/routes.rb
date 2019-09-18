Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login , sign_out: :logout }

  resources :badges, only: :index
  get 'badges/collected', to: "badges#collected", as: "collected_badges"

  resources :contacts, only: :create
  get 'contact-us', to: "contacts#new", as: "new_contact"

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  # GET /test_passages/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :badges
    resources :gists, only: :index
  end

end
