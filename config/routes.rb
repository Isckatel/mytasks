Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "project#index"

  get "/projects", to: "project#index"
  patch "/projects/:id/todos/:id", to: "project#update"
  post "/todos", to: "project#new"
  
  get  "/projects/add", to: "project#add"
  post "/projects", to: "project#create"
  # resources :titles, :path => :projects do
  #   resources :tasks 
  # end

end
