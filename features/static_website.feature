Feature: Get access to static websites
  As a client
  I want to see my dedicated websites
  But I can't access other websites
  Unless I am admin

    Background:
        Given the following files are located in the websites folder
            | path                           | content                             |
            | onlyForTestPurposes/index.html | <h1>This is what I want to see</h1> |
        And the following users exist:
            | name    | role   |
            | Jim     | client |
            | John    | client |
            | MrAdmin | admin  |
        And a website exists with name: "TestWebsite", folder: "onlyForTestPurposes", user: the 1st user

    Scenario Outline: See static websites
        Given I am logged in as "<username>" with password "secret1234"
        When I go to the static website "onlyForTestPurposes/index.html"
        Then I should <see?> "This is what I want to see"
        Examples:
            | username | see?    |
            | Jim      | see     |
            | John     | not see |
            | MrAdmin  | see     |

    Scenario: See links on the user's profile
        Given I am logged in as "Jim"
        When I go to Jim's profile page
        And I click "TestWebsite"
        Then I should be on the static website "onlyForTestPurposes/index.html"
