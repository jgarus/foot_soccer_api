# encoding: UTF-8
require 'sinatra'
require 'multi_json'

MultiJson.engine = :yajl

set :public_folder, 'public'

get '/teams' do
   content_type :json
   json = File.read('data/league_1.json')
end

 ## get '/:filename' do
  ## redirect 'images/clubs/league_1/'
 ## end
