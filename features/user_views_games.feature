Feature: User views games

  Scenario: User views game
    Given a game exists
    And I visit the homepage
    Then I should see the game

  Scenario: No games exist
    Given no games exist
    And I visit the homepage
    Then I should see the message "No games."
