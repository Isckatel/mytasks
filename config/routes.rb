Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "project#index"

  get "/projects", to: "project#index"
  get "/projects/:id/todo/:id", to: "project#edit"
  patch "/projects/:id/todo/:id", to: "project#update"
  post "/todos", to: "project#new"
  
  get  "/projects/add", to: "project#add"
  post "/projects", to: "project#create"

  get '/projects/:id/edit', to: 'project#edit'
  patch '/projects/:id/edit', to: 'project#update'

  get '/projects/:id/edit2', to: 'project#edit2'
  patch '/projects/:id/edit2', to: 'project#update2'

  # resources :titles, :path => :projects do
  #   resources :tasks 
  # end

end
