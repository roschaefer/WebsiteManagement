Feature: Show Home
    If I start the application I should see a greeting

    # serves as a 'hello world' cucumber test
    Scenario: Navigate to Home
        Given I am on the application page
        Then I should see "Welcome!"
