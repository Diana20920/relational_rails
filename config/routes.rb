Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/libraries', to: 'libraries#index'
  get '/libraries/new', to: 'libraries#new'
  post '/libraries', to: 'libraries#create'
  get '/libraries/:id', to: 'libraries#show'
  get '/libraries/:id/edit', to: 'libraries#edit'
  patch '/libraries/:id', to: 'libraries#update'
  delete '/libraries/:id', to: 'libraries#destroy', as: 'library'

  get '/novels', to: 'novels#index'
  get '/novels/new', to: 'novels#new'
  post '/novels', to: 'novels#create'
  get '/novels/:id', to: 'novels#show'
  get '/novels/:id/edit', to: 'novels#edit'
  patch '/novels/:id', to: 'novels#update'
  delete '/novels/:id', to: 'novels#destroy', as: 'novel'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'
  delete '/books/:id', to: 'books#destroy', as: 'book'

  get '/characters', to: 'characters#index'
  get '/characters/:id', to: 'characters#show'
  get '/characters/:id/edit', to: 'characters#edit'
  patch '/characters/:id', to: 'characters#update'
  delete '/characters/:id', to: 'characters#destroy', as: 'character'

  get '/libraries/:id/books', to: 'libraries#books_index'
end
