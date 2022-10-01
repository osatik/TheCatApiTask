Feature: Images

  Background:
    * def baseUrl = "https://api.thecatapi.com/v1"
@wip
  Scenario: Search images
    Given url baseUrl
    And path '/images/search'
    And header x-api-key = "live_TmHOSCjTcYzPEgrAPbaDMIsn9vqfI5FGA2OZilMK5p6qcc0xGbAvyNaVTNKi9erz"
    And header Content-Type = "application/json"
    When method GET
    Then status 200
    And print response
    And def image_id = response[0].id
    And string image_id = image_id
    And print image_id

