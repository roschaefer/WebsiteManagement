Feature: Show Home
    If I visit the home page I should see a greeting
    This is just a hello world test for cucumber

    Scenario: Navigate to Home
        Given I am on the home page
        Then I should see "Welcome!"
