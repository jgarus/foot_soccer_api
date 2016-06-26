# encoding: UTF-8
require 'sinatra'
require 'json'

get '/teams' do
  content_type :json
  File.read(File.join('public', 'lille.jpg'))
  jsonArr = {"teams":[{"name":"OSC Lille", "code":"OSC",
                        "shortName":"Lille", "marketValue":"67,700,000 e",
                        "imgUrl":"https://dry-harbor-40455.herokuapp.com/lille.jpg"},
                      {"name":"Paris Saint Germain", "code":"PSG",
                        "shortName":"PSG", "marketValue":"408,550,000 e",
                        "imgUrl":"https://dry-harbor-40455.herokuapp.com/psg.png"}]}.to_json
end

get '/:filename' do
  File.read(File.join('public', 'lille.jpg'))
end
