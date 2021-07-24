Rails.application.routes.draw do
  # resources :messages
  # resources :cards

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
 
  scope '/api' do #http://localhost:3000/api
    #CARD API: This rails api sends data from the postgress database to the react front end. http://localhost:3000/api/cards This is seperate from the third party rapid api.
    get '/cards', to: 'cards#index'
    post '/cards', to: 'cards#create'
    # If using cards/param, then enter that above cards/:id
    get '/cards/:id', to: 'cards#show'
    put '/cards/:id', to: "cards#update"
    delete '/cards/:id', to: "cards#destroy"
 
  #MESSAGES API: This rails api sends data from the postgress database to the react front end http://localhost:3000/api/messages/
    get '/messages', to: 'messages#index'
    post '/messages', to: 'messages#create'
    # If using messagess/param, then enter that above messages/:id
    get '/messages/:id', to: 'messages#show'
    put '/messages/:id', to: 'messages#update'
    delete '/messages/:id', to: 'messages#destroy'
  end
end
