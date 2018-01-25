Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  
  post '/users' => 'users#create'
  delete '/users/:id' => 'users#destroy'

  get '/groups' => 'groups#index'
  get '/groups/:id' => 'groups#show'
  post '/groups' => 'groups#create'

  get '/group_users' => 'group_users#index'
  post '/group_users' => 'group_users#create'
  delete '/group_users' => 'group_users#destroy'

  post '/event_groups' => 'event_groups#create'
  

  get '/user_calendar_events' => 'user_calendar_events#index'
  get '/user_calendar_events/:id' => 'user_calendar_events#show'
  post '/user_calendar_events/' => 'user_calendar_events#create'
  patch '/user_calendar_events/:id' => 'user_calendar_events#update'
  delete '/user_calendar_events/:id' => 'user_calendar_events#destroy'

  get '/events' => 'events#index'
  get '/events/:id' => 'events#show'
  get '/events' => 'events#create'
end
