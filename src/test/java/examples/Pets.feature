Feature: Get API Demo

        Background:
    * url 'https://petstore.swagger.io/v2'
    * header Accept = 'application/json'
    * def expected_output = read('getPetResponse.json')
    
        Scenario: Add a new pet
            Given path 'pet'
              And def requestBody = read('postPetResponse.json')
              And request requestBody
             When method POST
             Then status 200
              And print response


        Scenario: Check if the Pets response status is 200
            Given path 'pet/910'
             When method Get
             Then status 200
              And print response
              And match response == expected_output
              And match response.name == "Angle"

        Scenario: Check if the Store response status is 404
            Given path 'store/order/1'
             When method Get
             Then status 404
              And print response


    
      