require 'sinatra'
require 'sinatra/reloader'

set :number, rand(101)

get '/' do
  guess = params["guess"].to_i
  message = game_flow(guess)
  erb :index, :locals => {:number => settings.number , :message => message}
end


def game_flow(guess)
  if guess > SECRET_NUMBER
    "Too high!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  else
    "You got it right!"
  end
end
