Feature: API Tests01

  Background:
    * url 'https://fakestoreapi.com/products'

  Scenario: Validar un producto específico
    Given path '11'
    When method GET
    Then status 200
    And match response contains
        """
    {
        id: 11,
        category: 'electronics',
        title: 'Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5',
        rating: { rate: 4.8, "count":319}
    }

        """
  Scenario: Validar categoría "electronics" y que contenga el id 11
    Given path 'category', 'electronics'
    When method GET
    Then status 200

    * def responseSize = karate.sizeOf(response)
    * def containsId11 = karate.jsonPath(response, "$[?(@.id == 11)]")
   # * print 'containsId11:', containsId11
    And match responseSize == 6
    And match containsId11 != null
