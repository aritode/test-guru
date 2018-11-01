Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true
  end

  get 'questions/:id/delete', to: 'questions#destroy'
end
