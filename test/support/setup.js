const { setDefaultTimeout, AfterAll, BeforeAll } = require('cucumber');
const { createSession, closeSession, client } = require('nightwatch-api');
const { stopWebDriver } = require('nightwatch-api');

setDefaultTimeout(60000);

BeforeAll(async () => {
  await createSession();
});

AfterAll(async () => {
  await client.end();
  await stopWebDriver();
  await closeSession();
});