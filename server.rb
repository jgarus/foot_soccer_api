# encoding: UTF-8
require 'sinatra'
require 'multi_json'

MultiJson.engine = :yajl

set :public_folder, 'public'

get '/teams' do
  content_type :json
  File.read('data/json/teams/league_1/league_1.json')
end

get '/leagues' do
  content_type :json
  File.read('data/leagues/leagues.json')
end
