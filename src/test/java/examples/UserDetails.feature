Feature: To check user details responses

Background: 
    * url 'https://reqres.in/api'
#    * header Accept= 'application/json'

Scenario: Check status for list user is 200
    Given path 'users'
   # And param page = 2
    When method GET
    Then status 200
    And match response.total == 12
    And print response 
    And print response.data[0].first_name
    And print response.data[0].last_name

Scenario: Check first name and last name of 2nd data element of Page 1
    Given path 'users'
    And param page = 1
    When method GET 
    Then status 200
    And print response
    And match response.data[1].first_name == "Janet"
    And match response.data[1].last_name == "Weaver"

   
Scenario: Check first name and last name of 2nd data element of Page 2
    Given path 'users'
    And param page = 2
    When method GET 
    Then status 200
    And print response
    And match response.data[1].first_name == "Lindsay"
    And match response.data[1].last_name == "Ferguson"


Scenario: Print Response Details
    Given path 'users'
   # And param page = 2
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseCookies
