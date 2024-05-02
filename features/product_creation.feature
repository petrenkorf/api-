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

  Scenario: Deleted products are not listed
    Given There is a product stored
    When I delete the product
    And I visit /products
    Then I should have a successful response
    And I should receive a json response
    And JSON response should have the key products
    And products key should be empty

  Scenario: Products are listed
    Given There is a product stored
    And I visit /products
    Then I should have a successful response
    And I should receive a json response
    And JSON response should have the key products
    And products key should not be empty

  Scenario: Create Valid Product
    When I send data to product endpoint
    Then I should have a successful response
    And I should receive a json response
    And Product data should be in response
