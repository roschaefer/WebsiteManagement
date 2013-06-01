Given /^a website named "([^\"]*)" was assigned to "([^\"]*)"$/ do |website, username|
  user = userWithName(username)
  step "a website exists with name: \"#{website}\", user_id: \"#{user.id}\""
end

Given /^there is at the moment at least one more website for (.+?)$/ do |username|
  user = userWithName(username)
  step "a website exists with name: \"totallyUnimportant\", user_id: \"#{user.id}\""
end

And /^I navigate to the website management path for "(.*)"$/ do |website_name|
  click_on "Websites"
  website = Website.find_by_name(website_name)
  click_on website.id
end
