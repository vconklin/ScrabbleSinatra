require 'sinatra'
require_relative 'lib/score'

class ScrabbleApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/score' do
    @my_score = 0
    erb :score
  end

  get '/score-many' do
    @my_score = 0
    erb :score_many
  end

  post '/score' do
    # @my_score = Score.new(params["given_word"])
    @my_score = Score.score(params["given_word"])
    erb :score
  end

run!
end
