Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/chatroom' => 'messages#index'
  post '/messages' => 'messages#create'
  post '/login' => 'users#login'

  #WebSocket cable requests
  mount ActionCable.server => '/cable'
end
