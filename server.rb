# encoding: UTF-8
require 'sinatra'
require 'multi_json'

MultiJson.engine = :yajl

set :public_folder, 'public'

get '/teams' do
  content_type :json
  File.read('data/json/teams/ligue_1/ligue_1.json')
end

get '/leagues' do
  content_type :json
  File.read('data/leagues/leagues.json')
end
