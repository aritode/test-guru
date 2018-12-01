Rails.application.routes.draw do

  root 'tests#index'

  get :sign_up, to: 'users#new'
  get :login,   to: 'sessions#new'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  # get '/tests/:category/:title', to: 'tests#search', level: 2

  # GET /test_passages/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end
