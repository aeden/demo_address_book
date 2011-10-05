require 'sinatra'

$:.unshift('./lib')
require 'card'

get '/cards' do

end

post '/cards' do
  card = Card.new
  [201, {}, JSON.generate(card.attributes)]
end
