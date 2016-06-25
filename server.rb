# encoding: UTF-8
require 'sinatra'
require 'json'

get '/teams' do
  content_type :json
  jsonArr = {"teams":[{"name":"OSC Lille", "code":"OSC",
                        "shortName":"Lille", "marketValue":"67,700,000 e",
                        "imgUrl":"https://upload.wikimedia.org/wikipedia/fr/7/79/LogoSmc2013.png"},
                      {"name":"Paris Saint Germain", "code":"PSG",
                        "shortName":"PSG", "marketValue":"408,550,000 e",
                        "imgUrl":"https://upload.wikimedia.org/wikipedia/fr/7/79/LogoSmc2013.png"}]}.to_json
end
