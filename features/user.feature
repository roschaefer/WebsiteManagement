Feature: Manage Users
  In order to see user details
  As a security enthusiast
  I want to see user profiles only when authorized

    Scenario: Show profile
        Given the following users exist
          | name | email           | password   | password_confirmation | role   |
          | Bob  | bob@example.com | secret1234 | secret1234            | client |
        Given I am logged in with email "bob@example.com" and password "secret1234"
        When I go to Bob's profile page
        Then I should see "Bob"


    #Given the following user records
      #| username | password | admin |
      #| bob      | secret   | false |
      #| admin    | secret   | true  |
    #Given I am logged in as "<login>" with password "secret"
    #When I visit profile for "<profile>"
    #Then I should <action>

    #Examples:
      #| login | profile | action                 |
      #| admin | bob     | see "Edit Profile"     |
      #| bob   | bob     | see "Edit Profile"     |
      #|       | bob     | not see "Edit Profile" |
      #| bob   | admin   | not see "Edit Profile" |
