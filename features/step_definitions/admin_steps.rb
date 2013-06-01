When /^I navigate to the user management for "(.*)"$/ do |username|
  click_on "Users"
  user = User.find_by_name(username)
  click_on user.id
  click_on "Edit User"
end
