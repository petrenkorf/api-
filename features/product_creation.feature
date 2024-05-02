Feature: Create Product
  In order to create a catalog
  As an user
  I want to create and manage products

  Scenario: List Products
    Given There are no products stored
    When I visit /products
    Then I should have a successful response
    And I should receive a json response
    And JSON response should have the key products
    And products key should be empty


  Scenario: Create Valid Product
    When I send data to product endpoint
    Then I should have a successful response
    And I should receive a json response
    And Product data should be in response
