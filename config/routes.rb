Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"

  resources :shelters do
    resources :pets, controller: "shelter_pets", only: [:index, :new, :create]
  end

  resources :pets

  resources :user_applications
  end
