Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "book#index"
  #get '/bookIndex' , to: "book#index"
  get '/bookList' , to: "book#list"
  get '/bookShow' , to: "book#show"   
  get '/response' , to: "book#apiCall"
  get '/user/:id/:name' , to: "book#user"
  post '/add' , to: "book#add"
  get '/delete/:id' , to: "book#delete"  
  get '/search' , to: "book#search"
  get '/update/:id' , to: "book#update"
  post '/updateform', to: "book#updateform"


end
