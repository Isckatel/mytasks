Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "project#index"

  get "/projects", to: "project#index"

  resources :title1 do
    resources :task1
  end
end
