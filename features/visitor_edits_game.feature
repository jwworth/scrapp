Feature: Vistor edits game

  Scenario: With valid data
    Given two players exist
    And a game exists
    When I visit the homepage
    And I click "Edit"
    Then I should see the edit game page
    When I fill in the form
    And I click "Submit"
    Then I should see my edited game

  Scenario: With invalid data
    Given two players exist
    And a game exists
    When I visit the homepage
    And I click "Edit"
    Then I should see the edit game page
    When I fill in the form with invalid data
    And I click "Submit"
    Then I should see the edit game page
