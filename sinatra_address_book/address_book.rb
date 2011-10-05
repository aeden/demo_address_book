require 'sinatra'

$:.unshift('./lib')
require 'card'

get '/cards' do
  [200, {}, Card.all.to_json]
end

get '/cards/:id' do |id|
  [200, {}, Card.find(id).to_json]
end

post '/cards' do
  card = Card.create!
  [201, {}, card.to_json]
end
