require 'sinatra'

$:.unshift('./lib').unshift('.')

require 'middleware/json_body'

use JsonBody

require 'card'

get '/cards' do
  [200, {}, Card.all.to_json]
end

get '/cards/:id' do |id|
  [200, {}, Card.find(id).to_json]
end

post '/cards' do
  card = Card.create!(params)
  [201, {}, card.to_json]
end

put '/cards/:id' do |id|
  card = Card.find(id)
  card.update_attributes(params)
  [200, {}, card.to_json]
end

delete '/cards/:id' do |id|
  Card.destroy(id)
  [200, {}, nil]
end
