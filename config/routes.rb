Rails.application.routes.draw do
  devise_for :users
  root to: "calories#index"
  resources :calories
  resources :foods
end
