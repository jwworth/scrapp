Feature: Visitor views homepage

  Scenario: Visitor sees link to Github
    Given I visit the homepage
    Then I should see a link to the source code

  Scenario: Visitor sees the copyright information
    Given I visit the homepage
    Then I should see the copyright information

