Rails.application.routes.draw do
  devise_for :users
  root to: "calories#index"
  resources :calories do
    resources :messages, only: :create
  end

  resources :foods do
    collection do
      get 'search'
    end
  end
end