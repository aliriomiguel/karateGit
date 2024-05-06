Feature: Articles

Background: Define URL
    Given url apiURL


Scenario: Create a new article
    Given path 'articles'
    And request {"article": {"title": "Test From Karate 7","description": "Testing post request from karate","body": "Karate made a post request and the article is created","tagList": []}}
    When method Post
    Then status 201
    And match response.article.title == 'Test From Karate 7'

Scenario: Create and delete article
    Given path 'articles'
    And request {"article": {"title": "Deleteable Article","description": "An article to delete","body": "An article created meant to be deleted","tagList": []}}
    When method Post
    Then status 201
    * def articleId = response.article.slug

    Given params {limit: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title == "Deleteable Article"

    Given path 'articles',articleId
    When method Delete 
    Then status 204

    Given params {limit: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title != 'Deleteable Article'