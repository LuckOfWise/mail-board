Rails.application.routes.draw do
  devise_for :users
  resource :inbox, controller: :inbox, only: %i(show create)
  resources :boards, except: %i(edit update) do
    resources :comments, only: %i(create destroy)
  end
  root 'boards#index'
end
