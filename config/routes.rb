Rails.application.routes.draw do
  # resources :messages
  # resources :cards

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #CARD API 
  scope '/cardapi' do #http://localhost:3000/cardapi/cards
    get '/cards', to: 'cards#index'
    post '/cards', to: 'cards#create'
    # If using cards/param, then enter that above cards/:id/
    get '/cards/:id', to: 'cards#show'
    put '/cards/:id', to: "cards#update"
    delete '/cards/:id', to: "cards#destroy"
  end
  #MESSAGES API
  scope '/messageapi' do #http://localhost:3000/cardapi/cards
    get '/messages', to: 'messages#index'
    post '/messages', to: 'messages#create'
    get '/messages/:id', to: 'messages#show'
    put '/messages/:id', to: 'messages#update'
    delete '/messages/:id', to: 'messages#destroy'
  end
end
