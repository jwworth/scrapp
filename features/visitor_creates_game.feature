Feature: Vistor creates game

  Scenario: With valid data
    When I visit the homepage
    And two players exist
    And I click "New Game"
    Then I should see the new game page
    When I fill in the form
    And I click "Submit"
    Then I should see my new game

  Scenario: With invalid data
    When I visit the homepage
    And two players exist
    And I click "New Game"
    Then I should see the new game page
    When I fill in the form with invalid data
    And I click "Submit"
    Then I should see the new game page
