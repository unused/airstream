Feature: error handling

In order to get notice of an error
As a user using airstream
I want to know if anything goes wrong

  Scenario: no file given
    When I execute airstream
    Then the exit status should be 1
      And the output should contain "No arguments given"
      And I should see the usage message

