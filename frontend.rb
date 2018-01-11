require 'unirest'
require 'pp'

base_url = 'localhost:3000'
p 'What would you like to do?'

p '[1] Sign Up'

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


end
