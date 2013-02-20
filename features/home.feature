Feature: Show Home
    If I visit the home page I should see a greeting

    # serves as a 'hello world' cucumber test
    Scenario: Navigate to Home
        Given I am on the home page
        Then I should see "Welcome!"
