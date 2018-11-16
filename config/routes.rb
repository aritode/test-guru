Rails.application.routes.draw do

  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true
    end
  end

  # get '/tests/:category/:title', to: 'tests#search', level: 2

end
