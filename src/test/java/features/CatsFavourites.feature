@wip
Feature: Favourites

  Background:
    * def baseUrl = "https://api.thecatapi.com/v1"

  Scenario: Create favourites
      #create
    Given url baseUrl
    And path '/favourites'
    And header x-api-key = "live_TmHOSCjTcYzPEgrAPbaDMIsn9vqfI5FGA2OZilMK5p6qcc0xGbAvyNaVTNKi9erz"
    And header Content-Type = "application/json"
#    And request read ('classpath:requestBodies/createFavourites.json')
    And request
  """
  {
  "image_id": read ('classpath:features/CatImages.feature').image_id,
  "sub_id": "my-user-1234"
  }
  """
    When method POST
    Then status 200
    And print response
    And def favourite_id = response.id
    And string favourite_id = favourite_id

    #List favourite
    Given url baseUrl
    And path '/favourites'
    And header x-api-key = "live_TmHOSCjTcYzPEgrAPbaDMIsn9vqfI5FGA2OZilMK5p6qcc0xGbAvyNaVTNKi9erz"
    And header Content-Type = "application/json"
    When method GET
    Then status 200
    And print response

      #delete (Let's delete it to be able to favourite again)
    Given url baseUrl
    And path '/favourites', favourite_id
    And header x-api-key = "live_TmHOSCjTcYzPEgrAPbaDMIsn9vqfI5FGA2OZilMK5p6qcc0xGbAvyNaVTNKi9erz"
    And header Content-Type = "application/json"
    When method Delete
    Then status 200
    And print response
    And string response = response
    And match response contains "SUCCESS"
    And match response !contains "Message:"

  Scenario: Get favourites
    Given url baseUrl
    And path '/favourites'
    And header x-api-key = "live_TmHOSCjTcYzPEgrAPbaDMIsn9vqfI5FGA2OZilMK5p6qcc0xGbAvyNaVTNKi9erz"
    And header Content-Type = "application/json"
    When method GET
    Then status 200
    And print response

  Scenario: Get sources
    Given url baseUrl
    And path '/sources'
    And param limit = '10'
    And param page = '0'
    And header Content-Type = "application/json"
    When method GET
    Then status 200
    And print response
    And match response[*].id == '#present'
    And match response[3].id == 4
    And match response[*].url != "#number"

  Scenario: Get categories
    Given url baseUrl
    And path '/categories'
    And header Content-Type = "application/json"
    When method GET
    Then status 200
    And print response
    And match each response[*].name == "#string"
    And match each response[*].name != "#number"

