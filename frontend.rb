require 'unirest'
require 'pp'

while true
  base_url = 'localhost:3000'
  p 'What would you like to do?'

  p ' [1] Sign Up '
  p ' [2] Log in '
  p ' [3] Log out '
  p ' '
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
    elsif user_input == 'exit'
      break
      

    end
end