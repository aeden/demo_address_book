Feature: show a card
  As an API client
  In order to see a single contact
  I can show a card

  Scenario:
    Given I send and accept JSON
    And I have created a card
    And I store the card id to use it in a future API call
    When I send a GET request to "/cards/{{id}}"
    Then the response status should be "200"
    And the response body should be a JSON representation of the Card
