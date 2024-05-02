Feature: Create Product
  In order to create a catalog
  As an user
  I want to create and manage products

  Scenario: Create Valid Product
    When I send data to product endpoint
    Then I should have a successful response
    And I should receive a json response
    And Product data should be in response
