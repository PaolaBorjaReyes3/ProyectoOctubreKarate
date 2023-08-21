Feature: API Tests01

  @Prueba3
  Scenario: Create pet
    Given url 'https://petstore.swagger.io'
    And path '/v2/pet'
    And request
    """
    {
      "id": 0,
      "category": {
        "id": 0,
        "name": "string"
      },
      "name": "doggie",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "available"
    }
    """
    When method POST
    Then status 200
    And match response == { id: '#number', category: { id: '#number', name: '#string' }, name: 'doggie', photoUrls: ['#string'], tags: [{ id: '#number', name: '#string' }], status: 'available' }
    And eval karate.log('New pet created with ID:', response.id)
    And def createdPetId = response.id
    And karate.set('petId', createdPetId)

  Scenario: Consult id pet created
    Given url 'https://petstore.swagger.io'
    And path '/v2/pet/9223372036854577471'
    When method GET
    Then status 200
    And eval karate.log('Get Pet:', response.id)

  Scenario: Update name and status pet created
    Given url 'https://petstore.swagger.io'
    And path '/v2/pet/'
    And request
     """
    {
      "id": 9223372036854574925,
      "category": {
        "id": 0,
        "name": "string"
      },
      "name": "fido",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "sold"
    }
    """
    When method PUT
    Then status 200
    And eval karate.log('Put Pet:', response.id)

  Scenario: Consult status pet created
    Given url 'https://petstore.swagger.io'
    And path '/v2/pet/findByStatus'
    And param status = 'sold'
    When method GET
    Then status 200
    And eval karate.log('Get Pet:', response.status)



