# encoding: UTF-8
require 'sinatra'
require 'multi_json'



MultiJson.engine = :yajl
set :public_folder, 'public'
set :protection, :except => [:json_csrf]


get '/' do
  erb :'index.html'
end

# route to load the teams JSON data
get '/teams' do
  content_type :json
  logger.info "Loading team data..."
  File.read('data/json/teams/ligue_1/ligue_1.json')
end

# route to load the leagues JSON data
get '/leagues' do
  content_type :json
  logger.info "Loading league info..."
  File.read('data/json/leagues/leagues.json')
end


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
