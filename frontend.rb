require 'unirest'
require 'pp'

while true
  base_url = 'localhost:3000'
  p 'What would you like to do?'

  p '[1] Sign Up'
  p '[2] Log in'
  p '[3] Log out'
  p '[4] Create a group'
  p '[5] See all your groups'
  p '[6] Add an existing calendar event'
  p '[7] See all your events'
  p '[8] Edit one of your events'
  p '[9] Remove an event'
  p ' Type exit to leave app'
  user_input = gets.chomp

  if user_input == '1'
    the_params = {}
    p 'Enter your full name'
    the_params[:full_name] = gets.chomp
    p 'Enter your email address'
    the_params[:email_address] = gets.chomp
    p 'Create a Username'
    the_params[:username] = gets.chomp
    p 'Create a Password'
    the_params[:password] = gets.chomp
    p 'Confirm your Password'
    the_params[:password_confirmation] = gets.chomp
    response = Unirest.post("#{base_url}/users", parameters: the_params)
    pp response.body
  elsif user_input == '2'
    p 'Enter your Email'
    user_email = gets.chomp
    p 'Enter your Password'
    user_password = gets.chomp
    response = Unirest.post("#{base_url}/user_token", parameters:
      {
        auth: {
          email: user_email,
          password: user_password
        }
      }
    )
    jwt = response.body["jwt"]
    Unirest.default_header("Authorization", "Bearer #{jwt}")
    p jwt
  elsif user_input == '3'
    jwt = ""
    Unirest.clear_default_headers()
    p jwt
  elsif user_input == '4'
    p 'Enter the name of your group'
    the_params[:group_title] = gets.chomp
    response = Unirest.post("#{base_url}/groups", parameters: the_params)
    pp response.body
  elsif user_input == '5'
    response = Unirest.get("#{base_url}/groups")
    pp response.body
  elsif user_input == '6'
    the_params = {}
    p 'Enter the event title'
    the_params[:event_title] = gets.chomp
    p 'Enter the date of your event (mm/dd/yy)'
    the_params[:date] = gets.chomp
    p 'Enter the start time of the event (00:00 AM)'
    the_params[:start_time] = gets.chomp
    p 'Enter the end time of the event in (00:00 AM)'
    the_params[:end_time] = gets.chomp
    response = Unirest.post("#{base_url}/user_calendar_events", parameters: the_params)
    pp response.body
  elsif user_input == '7'
    response = Unirest.get("#{base_url}/user_calendar_events")
    pp response.body
  elsif user_input == '8'
    p 'Enter the id of the event you would like to modify'
    input_event_id = gets.chomp
    response = Unirest.get("#{base_url}/user_calendar_events/#{input_event_id}")
    calendar_event = response.body
    the_params = {}
    p "Enter the new title of the event. It is currently #{calendar_event[:event_title]}"
    the_params[:event_title] = gets.chomp
    p "Enter the new title of the event. It is currently #{calendar_event[:date]}"
    the_params[:date] = gets.chomp
    p "Enter the new title of the event. It is currently #{calendar_event[:start_time]}"
    the_params[:start_time] = gets.chomp
    p "Enter the new title of the event. It is currently #{calendar_event[:end_time]}"
    the_params[:end_time] = gets.chomp
    response = Unirest.patch("#{base_url}/user_calendar_events/#{input_event_id}", parameters: the_params)
    pp response.body
  elsif user_input == '9'
    p 'Enter the id number of the event you would like to remove'
    input_event_id = gets.chomp
    response = Unirest.delete("#{base_url}/user_calendar_events/#{input_event_id}")
    p 'Event has been removed'

  elsif user_input == 'exit'
    break
  end
end