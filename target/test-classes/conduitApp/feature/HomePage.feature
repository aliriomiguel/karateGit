
Feature: Test for the home page

    Background: Define URL
        Given url apiURL

    Scenario: get all tag
        Given path 'tags'
        When method Get 
        Then status 200
        And match response.tags contains ['ipsum', 'eos']
        And match response.tags !contains 'cars'
        And match response.tags contains any ['fish', 'dog', 'facilis']
        And match response.tags == '#array'
        And match each response.tags == '#string'

    Scenario: get 10 articles from the home page
        Given params { limit: 10, offset: 0}
        Given path 'articles'
        When method Get 
        Then status 200
        And match response.articles == '#[10]'
        And match response.articlesCount == 252
        And match response.articlesCount != 100
        And match response == {"articles": "#array", "articlesCount": 252}
        And match response.articles[0].createdAt contains '2024'
        And match response.articles[*].favoritesCount contains 4
        And match response..bio contains null
        And match each response..following == false
        And match each response..following == '#boolean'
        And match each response..favoritesCount == '#number'
        And match each response..bio == '##string'