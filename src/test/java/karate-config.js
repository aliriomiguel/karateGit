function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiURL: 'https://conduit.productionready.io/api/'
  }
  if (env == 'dev') {
    config.userEmail = 'karatetest2024@test.com'
    config.userPassword = 'Karate123'
  } 
  
  if (env == 'qa') {
    config.userEmail = 'karatetest2025@test.com'
    config.userPassword = 'Karate12345'
  }

  var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature', config).authToken
  karate.configure('headers', {Authorization: 'Token ' + accessToken})

  return config;
}