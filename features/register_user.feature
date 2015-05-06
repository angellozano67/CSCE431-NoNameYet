Feature: Register user account
  In order to view account required content
  As a visitor to the site
  I want to be able to register an account and perform user actions
 
  Scenario: Register user account
    When I am on the home page
    Then I can navigate to the login page
    And when I click "Sign up now"
    Then I see "Sign up"
    Then I fill in the signup form
    Then I see "User Details"
