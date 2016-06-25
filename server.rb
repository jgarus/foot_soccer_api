# encoding: UTF-8
require 'sinatra'
require 'json'

get '/teams' do
  content_type :json
  jsonArr = {"teams":[{"name":"OSC Lille", "code":"OSC",
                        "shortname":"Lille", "marketValue":"67,700,000 e",
                        "image":"http://upload.wikimedia.org/wikipedia/de/0/08/LOSC_Lille_Crest_2012.png"},
                      {"name":"Paris Saint Germain", "code":"PSG",
                        "shortname":"PSG", "marketValue":"408,550,000 e",
                        "image":"http://upload.wikimedia.org/wikipedia/de/1/1e/Paris_Saint-Germain_(seit_2013).gif"}]}.to_json
end
