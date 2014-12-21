Rails.application.routes.draw do
  devise_for :users
  namespace :inbox do
    resource :boards, only: %i(show create)
    resource :comments, only: %i(show create)
  end
  resources :boards, except: %i(edit update) do
    resources :comments, only: %i(create destroy)
  end
  root 'boards#index'
end
