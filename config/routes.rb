Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "images_generation#new"

  resources :images_generation, only: %i[new create show]
end
