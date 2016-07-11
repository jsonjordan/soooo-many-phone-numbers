Rails.application.routes.draw do
  resources :userphones, only: [:new, :create, :edit, :update]

  root to: "userphones#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
