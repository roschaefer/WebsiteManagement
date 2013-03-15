Feature: Grant Clients Access to static websites
    As an admin
    In order to show my work to my clients
    I want to upload my work as a zip archive
    And I want to grant access my clients to their websites



    Background:
        Given the following users exist
            | name    | role   |
            | Justin  | client |
            | MrAdmin | admin  |
        And the website exists with name: "IamATestwebsite"

    Scenario: Assign a website to a client
        Given I am logged in as "MrAdmin" with password "secret1234"
        And I go to the admin root page
        And I click "Websites"
        Then I should see "IamATestwebsite"
        When I click "Edit"
        And I select "Justin" from "User"
        And I press "Update Website"
        And I go to Justin's profile page
        And I click "IamATestwebsite"
        Then I should see "This is what I want to see"
    @wip
    Scenario: Assign a website that consist of a zipped folder
        Given the website with a folder zipped exists with name: "IamAnotherTestwebsite"
        And I am logged in as "MrAdmin" with password "secret1234"
        And I go to the admin root page
        And I click "Websites"
        And I click "2"
        Then I should see "IamAnotherTestwebsite"
        When I click "Edit Website"
        And I select "Justin" from "User"
        And I press "Update Website"
        And I go to Justin's profile page
        And I click "IamAnotherTestwebsite"
        Then I should see "I am the website that was zipped in a whole directory"

    Scenario: Client has access to assigned website
        Given I am logged in as "Justin" with password "secret1234"
        And a website named "AnotherTestWebsite" was assigned to "Justin"
        And I go to Justin's profile page
        And I click "AnotherTestWebsite"
        Then I should see "This is what I want to see"
