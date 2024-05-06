Feature: Sign Up new user

    Background: Preconditions
        * def dataGenerator = Java.type('helpers.DataGenerator')
        * def timeValidator = read('classpath:helpers/timeValidator.js')
        * url apiURL

    @debug
    Scenario: New user Sign Up
        * def randomEmail = dataGenerator.getRandomEmail()
        * def randomUsername = dataGenerator.getRandomUsername()
        
        Given path 'users'
        And request
        """
            {
                "user":{
                    "email": #(randomEmail),
                    "password": "Karate123",
                    "username": #(randomUsername)
                }
            }
        """
        When method Post
        Then status 201
        And match response ==
        """
            {
            "user": {
                "id": "#number",
                "email": #(randomEmail),
                "username": #(randomUsername),
                "bio": null,
                "image": "#string",
                "token": "#string"
            }
}
        """