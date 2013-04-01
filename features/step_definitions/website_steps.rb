Given /^a website named "([^\"]*)" was assigned to "([^\"]*)"$/ do |website, username|
  user = userWithName(username)
  step "a website exists with name: \"#{website}\", user_id: \"#{user.id}\""
end
Given /^there is at the moment at least one more website for (.+?)$/ do |username|
  user = userWithName(username)
  step "a website exists with name: \"totallyUnimportant\", user_id: \"#{user.id}\""
end
