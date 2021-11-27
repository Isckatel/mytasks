Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "project#index"

  get "/projects", to: "project#index" 
  patch "/projects/:title_id/todo/:id", to: "project#update"
  post "/todos", to: "project#new" 

end
