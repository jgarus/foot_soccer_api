# encoding: UTF-8
require 'json'
require 'sinatra'

get '/teams' do
  content_type :json
  jsonArr = {"teams":[{"name":"OSC Lille", "code":"OSC",
                        "shortname":"Lille", "marketValue":"67,700,000 e"},
                      {"name":"Paris Saint Germain", "code":"PSG",
                        "shortname":"PSG", "marketValue":"408,550,000 e"}]}.to_json
end
