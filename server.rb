# encoding: UTF-8
require 'sinatra'
require 'multi_json'

MultiJson.engine = :yajl
set :public_folder, 'public'
set :protection, :except => [:json_csrf]

get '/' do
  erb :index
end

get '/teams' do
  content_type :json
  File.read('data/json/teams/ligue_1/ligue_1.json')
end

get '/leagues' do
  content_type :json
  File.read('data/leagues/leagues.json')
end
