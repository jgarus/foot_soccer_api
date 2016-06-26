# encoding: UTF-8
require 'sinatra'
require 'json'

set :public_folder, 'public'

get '/teams' do
  content_type :json
  jsonArr = {"teams":[{
                        "name":"Paris Saint Germain",
                        "code":"PSG",
                        "shortName":"PSG",
                        "marketValue":"408,550,000 e",
                        "imgUrl":"https://dry-harbor-40455.herokuapp.com/images/clubs/league_1/psg.png"},
                      {
                        "name":"Olympique Lyonnais",
                        "code":"OLY",
                        "shortName":"Lyon",
                        "marketValue":"163,100,000 €",
                        "imgUrl":"https://dry-harbor-40455.herokuapp.com/images/clubs/league_1/lyon.png"},
                        {
                          "name":"AS Monaco FC",
                          "code":"MON",
                          "shortName":"Monaco",
                          "marketValue":"147,100,000 €",
                          "imgUrl":"https://dry-harbor-40455.herokuapp.com/images/clubs/league_1/monaco.png"
                        }
                      ]}.to_json
end

get '/:filename' do
  redirect 'images/clubs/league_1/'
end
