const { startWebDriver } = require('nightwatch-api');

startWebDriver({env: 'default'}).catch(err => console.log(err));