require 'spec_helper'

describe "create card" do
  context "through the API" do
    let(:headers) do
      {
        'HTTP_ACCEPT' => 'application/json',
        'HTTP_CONTENT_TYPE' => 'application/json'
      }
    end
    let(:body) do
      {
        "first_name" => "Anthony",
        "last_name" => "Eden",
        "display_name" => "Anthony Eden",
      }
    end

    it "creates a card" do
      post '/cards', body.to_json, headers 
      response.status.should eq(201)
      response.body.should eq(Card.last.to_json)
    end
  end
end
