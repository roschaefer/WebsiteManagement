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
            | name          | role   |
            | aClient       | client |
            | anotherClient | client |
            | theAdmin      | admin  |
        And a website exists with folder: "onlyForTestPurposes", user: the 1st user

    Scenario Outline: See static websites
        Given I am logged in as "<username>" with password "secret1234"
        When I go to the static website "onlyForTestPurposes/index.html"
        Then I should <see?> "This is what I want to see"
        Examples:
            | username      | see?    |
            | aClient       | see     |
            | anotherClient | not see |
            | theAdmin      | see     |
