Feature: create a card
  As an API client
  In order to add a person or business to the address book
  I can create a card

  Scenario: create a card with JSON
    Given I send and accept JSON
    When I send a POST request to "/cards" with the following:
    """
    {
      "first_name":"Anthony",
      "last_name":"Eden",
      "display_name":"Anthony Eden",
      "emails":[
        {
          "address_type":"personal",
          "address":"anthonyeden@gmail.com"
        },
        {
          "address_type":"work",
          "address":"anthony@dnsimple.com"
        }
      ]
    }
    """
    Then the response status should be "201"
    And the response body should be a JSON representation of the Card

  Scenario: create a card with XML
    Given I send and accept XML
    When I send a POST request to "/cards" with the following:
    """
    <?xml version="1.0"?>
    <card>
      <first_name>Anthony</first_name>
      <last_name>Eden</last_name>
      <display_name>Anthony Eden</display_name>
    </card>
    """
    Then the response status should be "201"
    And the response body should be an XML representation of the Card
