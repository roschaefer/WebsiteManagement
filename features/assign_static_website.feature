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
        And the website with a folder zipped exists with name: "IamAnotherTestwebsite"
        And there is at the moment at least one more website for Justin

    Scenario Outline: Assign a website to a client
        Given I am logged in as "MrAdmin" with password "secret1234"
        And I go to the admin root page
        And I navigate to the website management path for "<website_name>"
        Then I should see "<website_name>"
        When I click "Edit Website"
        And I select "Justin" from "User"
        And I press "Update Website"
        And I go to Justin's profile page
        And I click "<website_name>"
        Then I should see "<content>"
        Examples: zip archive with flat hierarchy
            | id | website_name    | content                    |
            | 1  | IamATestwebsite | This is what I want to see |
        Examples: zip archive containing one folder with html content
            | id | website_name          | content                                               |
            | 2  | IamAnotherTestwebsite | I am the website that was zipped in a whole directory |

    Scenario: Client has access to assigned website
        Given I am logged in as "Justin" with password "secret1234"
        And a website named "AnotherTestWebsite" was assigned to "Justin"
        And I go to Justin's profile page
        And I click "AnotherTestWebsite"
        Then I should see "This is what I want to see"
