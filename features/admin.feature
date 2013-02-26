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

    Scenario Outline: No Access to Admin Interface
        Given I am logged in as "<username>" with password "secret1234"
        When I go to the admin root page
        Then I should <action1> on the admin root page
        And I should <action2> on the home page
        And I should <action3> "not authorized"
        Examples: Unauthorized Users
            | username | action1 | action2 | action3 |
            | guest    | not be  | be      | see     |
            |          | not be  | be      | see     |
        Examples: Authorized Users
            | username | action1 | action2 | action3 |
            | Me       | be      | not be  | not see |
