Rails.application.routes.draw do
  root to: 'home#show'

  resources :lists do
    resources :tasks
  end
end
