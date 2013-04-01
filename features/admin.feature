Feature: Manage Admin Interface
  As a admin
  I want to get access to the admin interface
  As well I would like to have an ordinary profile page

    Background:
        Given the following users exist
          | name    | password   | password_confirmation | role   |
          | MrAdmin | secret1234 | secret1234            | admin  |
          | guest   | secret1234 | secret1234            | client |
          | James   | secret1234 | secret1234            | client |

    Scenario: Access to Admin Interface
        Given I am logged in as "MrAdmin" with password "secret1234"
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
            | MrAdmin  | be      | not be  | not see |

    Scenario: Navigate to admin interface
        Given I am logged in as "MrAdmin" with password "secret1234"
        And I go to MrAdmin's profile page
        And I click "Admin Interface"
        Then I should be on the admin root page

    Scenario: Don't navigate to admin interface
        Given I am logged in as "guest" with password "secret1234"
        And I go to guest's profile page
        Then I should not see "Admin Interface"

    Scenario: Change the role of a user
        Given I am logged in as "MrAdmin" with password "secret1234"
        When I go to the admin root page
        And I click "Users"
        And I click "3"
        And I click "Edit User"
        And I select "admin" from "Role"
        And I press "Update User"
        And I should see "User was successfully updated"
        And I click "Logout"
        And I am logged in as "James" with password "secret1234"
        And I go to the admin root page
        Then I should be on the admin root page
        And I should see "Dashboard"

    Scenario: Create a new user
        Given I am logged in as "MrAdmin" with password "secret1234"
        When I go to the admin root page
        And I click "Users"
        And I click "New User"
        And I fill in "aNewUser" for "Name"
        And I fill in "aNewUserEmail@example.com" for "Email"
        And I press "Create User"
        Then I should see "User was successfully created"
