Feature: Display static pages
  In order to view general site pages
  As a visitor to the site
  I want to see home, about, login, and contact pages
 
  Scenario: Display the home page
    When I am on the home page
    Then I see "Howdy, Brazos County"

  Scenario: Navigate to about page
    When I am on the home page
    Then I can navigate to the about page
    Then I see "About BVCIL"

  Scenario: Navigate to contact page
    When I am on the home page
    Then I can navigate to the contact page
    Then I see "Contact Details"

  Scenario: Navigate to contact page
    When I am on the home page
    Then I can navigate to the login page
    Then I see "Log in"
