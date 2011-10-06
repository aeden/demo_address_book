require 'rack/test'
include Rack::Test::Methods

require 'json'

$:.unshift('.')
require 'config/application'

def app
  RailsAddressBook::Application
end

describe "create card" do
  context "through the API" do
    let(:body) do
      {
        "first_name" => "Anthony",
        "last_name" => "Eden",
        "display_name" => "Anthony Eden",
        "emails" => [
          {
            "address_type" => "personal",
            "address" => "anthonyeden@gmail.com"
          },
          {
            "address_type" => "work",
            "address" => "anthony@dnsimple.com"
          }
        ]
      }
    end

    it "creates a card" do
      header 'Accept', 'application/json'
      header 'Content-Type', 'application/json'
      post '/cards', body.to_json
      puts last_response.body
      last_response.status.should eq(201)
      last_response.body.should eq(Card.last.to_json)
    end
  end
end
