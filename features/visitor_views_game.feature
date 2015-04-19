Feature: Visitor views game

  Scenario: Visitor views game
    Given a game exists
    And I visit the homepage
    Then I should see the game
    When I click on show
    Then I see the page for that game
