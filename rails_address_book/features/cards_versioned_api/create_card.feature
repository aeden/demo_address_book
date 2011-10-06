Feature: create a card
  As an API client
  In order to add a person or business to the address book
  I can create a card

  Scenario: path, version 1
    Given I send and accept JSON
    When I send a POST request to "/v1/cards" with the following:
    """
    {
      "first_name":"Anthony",
      "last_name":"Eden",
      "display_name":"Anthony Eden"
    }
    """
    Then the response status should be "201"
    And the response body should be a JSON representation of the Card

  Scenario: path, version 2
    Given I send and accept JSON
    When I send a POST request to "/v2/cards" with the following:
    """
    {
      "name": {
        "first": "Anthony",
        "last":"Eden",
        "display":"Anthony Eden"
      }
    }
    """
    Then the response status should be "201"
    And the response body should be a JSON representation of the Card

  Scenario: header, version 1
    Given I send and accept JSON using version 1 of the Card API
    When I send a POST request to "/cards" with the following:
    """
    {
      "first_name":"Anthony",
      "last_name":"Eden",
      "display_name":"Anthony Eden"
    }
    """
    Then the response status should be "201"
    And the response body should be a JSON representation of the Card

  Scenario: header, version 2
    Given I send and accept JSON using version 2 of the Card API
    When I send a POST request to "/cards" with the following:
    """
    {
      "name": {
        "first": "Anthony",
        "last":"Eden",
        "display":"Anthony Eden"
      }
    }
    """
    Then the response status should be "201"
    And the response body should be a JSON representation of the Card
