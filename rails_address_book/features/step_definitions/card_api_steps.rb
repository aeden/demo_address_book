Then /^the first name in the JSON representation of the card should be "([^"]*)"$/ do |first_name|
  JSON.parse(last_response.body)['first_name'].should eq(first_name)
end
