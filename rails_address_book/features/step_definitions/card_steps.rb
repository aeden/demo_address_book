Given /^I have created (\d+) cards$/ do |n|
  n.to_i.times do
    Card.create!(:first_name => 'John', :last_name => 'Smith')
  end
end

Given /^I have created a card$/ do
  Card.create!(:first_name => 'John', :last_name => 'Smith')
end

Given /^I store the card id to use it in a future API call$/ do
  @id = Card.last.id
end
