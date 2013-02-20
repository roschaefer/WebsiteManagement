Given /^I am logged in with email "([^\"]*)" and password "([^\"]*)"$/ do |email, password|
  unless email.blank?
    visit new_user_session_path
    fill_in "Email", :with => email
    fill_in "Password", :with => password
    click_button "Sign in"
  end
end
Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  unless username.blank?
    user = User.find_by_name(username)
    step "I am logged in with email \"#{user.email}\" and password \"#{password}\""
  end
end
