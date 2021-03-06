Feature: Manage Users
  In order to see user details
  As a security enthusiast
  I want to see user profiles only when authorized

    Background:
        Given the following users exist
          | name  | password   | password_confirmation | role   |
          | Bob   | secret1234 | secret1234            | client |
          | Admin | secret1234 | secret1234            | admin  |
          | Alice | secret1234 | secret1234            | client |

    Scenario Outline: Show profile
        Given I am logged in as "<username>" with password "secret1234"
        When I go to <profile>'s profile page
        Then I should <action>
    Examples:
      | username | profile | action          |
      | Admin    | Admin   | see "Admin"     |
      | Bob      | Bob     | see "Bob"       |
      |          | Bob     | not see "Bob"   |
      | Bob      | Alice   | not see "Alice" |
      | Admin    | Alice   | see "Alice"     |

    Scenario: Logout a user
        Given I am logged in as "Bob" with password "secret1234"
        And I go to Bob's profile page
        And I click "Logout"
        Then I should be on the home page
