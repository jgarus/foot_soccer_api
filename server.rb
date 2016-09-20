# encoding: UTF-8
require 'sinatra'
require 'multi_json'

MultiJson.engine = :yajl
set :public_folder, 'public'
set :protection, :except => [:json_csrf]


get '/' do
  erb :'index.html'
end

# Getting the Villarreal players
get '/players/laliga/villarreal' do
  content_type :json
  File.read('data/json/players/laliga_pl/villarreal/villarreal_pl.json')
end

# route to load the teams JSON data
get '/clubs/ligue_1' do
  content_type :json
  logger.info "Loading clubs data..."
  File.read('data/json/clubs/ligue_1/ligue_1.json')
end

# route to load the teams JSON data
get '/clubs/premier' do
  content_type :json
  logger.info "Loading clubs data..."
  File.read('data/json/clubs/premier/premier.json')
end

# route to load the teams JSON data
get '/clubs/laliga' do
  content_type :json
  logger.info "Loading clubs data..."
  File.read('data/json/clubs/laliga/laliga.json')
end

# route to load the teams JSON data
get '/clubs/bundesliga' do
  content_type :json
  logger.info "Loading clubs data..."
  File.read('data/json/clubs/bundesliga/bundesliga.json')
end

# route to load the teams JSON data
get '/clubs/serie_a' do
  content_type :json
  logger.info "Loading clubs data..."
  File.read('data/json/clubs/serie_a/serie_a.json')
end

# route to load the teams JSON data
get '/clubs/liga_mx' do
  content_type :json
  logger.info "Loading clubs data..."
  File.read('data/json/clubs/liga_mx/liga_mx.json')
end

# route to load the teams JSON data
get '/clubs/primeira' do
  content_type :json
  logger.info "Loading clubs data..."
  File.read('data/json/clubs/primeira/primeira.json')
end

# route to load the leagues JSON data
get '/leagues' do
  content_type :json
  logger.info "Loading league info..."
  File.read('data/json/leagues/leagues.json')
end


# 304 Error FIx maybe
def last_modified(time)
  return unless time
  time = time_for time
  response['Last-Modified'] = time.httpdate
  return if env['HTTP_IF_NONE_MATCH']

  if status == 200 and env['HTTP_IF_MODIFIED_SINCE']
    # compare based on seconds since epoch
    since = Time.httpdate(env['HTTP_IF_MODIFIED_SINCE']).to_i
    halt 304 if since >= time.to_i
  end

  if (success? or status == 412) and env['HTTP_IF_UNMODIFIED_SINCE']
    # compare based on seconds since epoch
    since = Time.httpdate(env['HTTP_IF_UNMODIFIED_SINCE']).to_i
    halt 412 if since < time.to_i
  end
rescue ArgumentError
end
