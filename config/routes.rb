Rails.application.routes.draw do
  devise_for :users
  root to: "calories#index"
  resources :calories do
    resources :messages, only: [:create,:destroy]
    collection do
      get 'index2', 'search'
    end
    member do
     get 'show2', 'edit2'
    end
  end
end