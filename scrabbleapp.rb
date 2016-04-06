require 'sinatra'
require_relative 'lib/score'

class ScrabbleApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/score' do
    erb :score
  end

  post '/score' do
    @my_score = Score.new(params["given_word"])
    erb :score
  end

run!
end
