Rails.application.routes.draw do
  resources :messages
  resources :cards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/cards', to: 'cards#index'
  post '/cards', to: 'cards#create'
  get '/messages', to: 'messages#index'
  post '/messages', to: 'messages#create'
end
