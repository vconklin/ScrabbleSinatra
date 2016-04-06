require 'sinatra'

class ScrabbleApp < Sinatra::Base

  get '/' do
    erb :index
  end

run!
end
