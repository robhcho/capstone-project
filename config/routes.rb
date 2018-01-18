Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  
  post '/users' => 'users#create'

  get '/groups' => 'groups#index'
  get '/groups' => 'groups#show'
  post '/groups' => 'groups#create'

  get '/user_calendar_events' => 'user_calendar_events#index'
  get '/user_calendar_events/:id' => 'user_calendar_events#show'
  post '/user_calendar_events/' => 'user_calendar_events#create'
  patch '/user_calendar_events/:id' => 'user_calendar_events#update'
  delete '/user_calendar_events/:id' => 'user_calendar_events#destroy'

end
