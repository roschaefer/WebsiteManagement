Given /^a website named "([^\"]*)" was assigned to "([^\"]*)"$/ do |website, username|
  begin
      user = User.find_by_name!(username)
  rescue Object => e
    raise "Can't find a user with name \"#{username}\"."
  end
  step "a website exists with name: \"#{website}\", user_id: \"#{user.id}\""
end
