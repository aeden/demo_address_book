Given /^I have created (\d+) cards$/ do |n|
  n.to_i.times do
    Card.create!(:first_name => 'John', :last_name => 'Smith')
  end
end
