Rails.application.routes.draw do
  resources :userphones, only: [:new, :create, :edit, :update, :index]

  root to: "userphones#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
