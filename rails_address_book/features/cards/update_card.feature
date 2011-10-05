Feature: update a card
  As an API client
  In order to update contact information for a person or business
  I can update a card

  Scenario:
    Given I send and accept JSON
    And I have created a card
    And I store the card id to use it in a future API call
    When I send a PUT request to "/cards/{{id}}" with the following:
    """
    {
      "first_name":"Jane"
    }
    """
    Then the response status should be "200"
    And the response body should be a JSON representation of the Card
    And the first name in the JSON representation of the card should be "Jane"
