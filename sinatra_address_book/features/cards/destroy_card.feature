Feature: destroy a card
  As an API client
  In order to remove a contact
  I can destroy a card

  Scenario:
    Given I send and accept JSON
    And I have created a card
    And I store the card id to use it in a future API call
    When I send a DELETE request to "/cards/{{id}}"
    Then the response status should be "200"

