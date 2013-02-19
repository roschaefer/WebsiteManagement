Feature: Manage Users
  In order to see user details
  As a security enthusiast
  I want to see user profiles only when authorized

    Scenario: Show profile
        Given the following user records
          | name  | email             | role   |
          | bob   | bob@example.com   | client |
          | alice | alice@example.com | client |
          | admin | admin@example.com | admin  |
          #| admin    | admin |
        #Given I am logged in as bob
        #When I visit profile for bob
        #Then I should see "Bob"


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
