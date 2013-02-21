Feature: Get access to static websites
  As a client
  I want to see my dedicated websites
  But I can't access other websites
  Unless I am admin

    Background:
        Given the following files are located in the websites folder
            | path                           | content                               |
            | onlyForTestPurposes/index.html | <h1>This is what I want to see</h1>\n |
        And a user exists with name: "aClient", role: "client"
        And a website exists with folder: "onlyForTestPurposes", user: the user
        And a user exists with name: "theAdmin", role: "admin"
        And a user exists with name: "anotherClient", role: "client"

    Scenario: See static websites as a dedicated client
        Given I am logged in as "aClient" with password "secret1234"
        When I go to the static website "onlyForTestPurposes/index.html"
        Then I should see "This is what I want to see"

    Scenario: See static websites as a different client
        Given I am logged in as "anotherClient" with password "secret1234"
        When I go to the static website "onlyForTestPurposes/index.html"
        Then I should not see "This is what I want to see"

    Scenario: See static websites as an admin
        Given I am logged in as "theAdmin" with password "secret1234"
        When I go to the static website "onlyForTestPurposes/index.html"
        Then I should see "This is what I want to see"
