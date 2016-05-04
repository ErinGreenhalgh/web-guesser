require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)
message = ""
number_message = ""

def check_guess(guess)
  if guess > SECRET_NUMBER + 5
    message = "Way too high!"
  elsif guess > SECRET_NUMBER && guess.to_i  <= SECRET_NUMBER + 5
    message = "Too high!"
  elsif guess == SECRET_NUMBER
    message = "You got it right! \n The SECRET NUMBER is #{SECRET_NUMBER}"
    # number_message = "The SECRET NUMBER is #{SECRET_NUMBER}"
    # message + '/n' + number_message
  elsif guess < SECRET_NUMBER && guess >= SECRET_NUMBER - 5
    message = "Too low!"
  else
    message = "Way too low!"
  end
end

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number_message => number_message, :message => message}
end
