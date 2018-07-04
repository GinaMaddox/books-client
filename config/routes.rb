Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :client do
    get '/books' => 'books#index'
    get '/books/new' => 'books#new'
    post '/books' => 'books#create'
    get '/books/:id' => 'books#show'
    get '/books/:id/edit' => 'books#edit'
    patch '/books/:id' => 'books#update'
    delete '/books/:id' => 'books#destroy'
  end
end
