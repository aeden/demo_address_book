Feature: list cards
  As an API client
  In order to get all of the people and businesses in an address book
  I can list cards

  Scenario:
    Given I send and accept JSON
    And I have created 2 cards
    When I send a GET require to "/cards"
    Then the response status should be "200"
    And the response body should be a JSON representation of the Card list
    And the response body should have 2 cards
    And show me the response body
