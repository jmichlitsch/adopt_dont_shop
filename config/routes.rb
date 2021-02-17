Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"

    #Shelters
  get "/shelters", to: "shelters#index"
  get "/shelters/new", to: "shelters#new", as: :shelters_new
  get "/shelters/:id", to: "shelters#show", as: :shelters_show
  delete "/shelters/:id", to: "shelters#destroy"
  post "/shelters", to: "shelters#create"
  get "/shelters/:id/edit", to: "shelters#edit", as: :shelters_edit
  patch "/shelters/:id", to: "shelters#update"

  #Pets
  get "/pets", to: "pets#index"
  get "/pets/:id", to: "pets#show", as: :pets_show
  get "/pets/:id/edit", to: "pets#edit", as: :pets_edit
  patch "/pets/:id", to: "pets#update"
  delete "/pets/:id", to: "pets#destroy"

  #ShelterPets
  get "/shelters/:shelter_id/pets", to: "shelter_pets#index", as: :shelter_pets
  get "/shelters/:shelter_id/pets/new", to: "shelter_pets#new", as: :shelter_pets_new
  post "/shelters/:shelter_id/pets", to: "shelter_pets#create"
  get "/shelters/:id/pets/:id", to: "pets#show"

  #Applications
  get "/user_applications", to: "user_applications#index", as: :user_applications
  get "user_applications/new", to: "user_applications#new", as: :user_applications_new
  get "/user_applications/:id/edit", to: "user_applications#edit", as: :user_applications_edit
  get "/user_applications/:id", to: "user_applications#show", as: :user_applications_show
  post "/user_applications", to: "user_applications#create"


  #Admin
  namespace :admin do
    resources :applications, only: [:show, :update]
  end

  #PetApplications
  Rails.application.routes.draw do
    resources :pet_applications, only: [:show, :update]
  end
end
