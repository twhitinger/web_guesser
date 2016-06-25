require 'sinatra'
require 'sinatra/reloader'

set :number, rand(101)

get '/' do
  guess = params["guess"].to_i
  message = game_flow(guess)
  color = background_color(message)
  erb :index, :locals => {:number => settings.number , :message => message, :color => color }
end

def background_color(message)
 if message == "Too high!" || message == "Too low!"
   "#ff0a12"
 else
   "#8cc63f"
 end
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
