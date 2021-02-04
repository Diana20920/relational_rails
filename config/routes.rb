Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/novels', to: 'novels#index'
  get '/libraries', to: 'libraries#index'
  get '/novels/new', to: 'novels#new'
  get '/libraries/new', to: 'libraries#new'

  post '/libraries', to: 'libraries#create'
  post '/novels', to: 'novels#create'

  get '/libraries/:id', to: 'libraries#show'
  get '/novels/:id', to: 'novels#show'

  get '/libraries/:id/edit', to: 'libraries#edit'
  patch '/libraries/:id', to: 'libraries#update'

  get '/novels/:id/edit', to: 'novels#edit'
  patch '/novels/:id', to: 'novels#update'

  delete '/novels/:id', to: 'novels#destroy'
  delete '/libraries/:id', to: 'libraries#destroy'

  get '/books', to: 'books#index'
  get '/characters', to: 'characters#index'

  get '/books/:id', to: 'books#show'
  get '/characters/:id', to: 'characters#show'

  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'

  get '/characters/:id/edit', to: 'characters#edit'
  patch '/characters/:id', to: 'characters#update'
end
