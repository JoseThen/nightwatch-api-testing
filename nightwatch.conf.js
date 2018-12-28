
module.exports = {
    webdriver: {
        default_path_prefix: '/wd/hub'
    },
    selenium_server: {
        selenium: {
            host: 'selenium-hub',
        }
    },
    test_settings: {
        default: {
            selenium_host: 'selenium-hub',
            selenium_port: 4444,
            desiredCapabilities: {
                browserName: 'chrome',
                javascriptEnabled: true,
                acceptSslCerts: true
            }
        }
    }
};