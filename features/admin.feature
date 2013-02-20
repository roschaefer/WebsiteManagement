Feature: Manage Admin Interface
  As a admin
  I want to get access to the admin interface
  As well I would like to have an ordinary profile page

    Background:
        Given the following users exist
          | name  | password   | password_confirmation | role   |
          | Me    | secret1234 | secret1234            | admin  |
          | guest | secret1234 | secret1234            | client |
    Scenario: Access to Admin Interface
        Given I am logged in as "Me" with password "secret1234"
        When I go to the admin root page
        Then I should be on the admin root page
        Then I should see "Websites"
        Then I should see "Users"

    Scenario: No Access to Admin Interface
        Given I am logged in as "guest" with password "secret1234"
        When I go to the admin root page
        Then I should not be on the admin root page
