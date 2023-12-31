@saucedemo
Feature: UI automation for Parabank

# mvn clean test -Dkarate.options="--tags @saucedemo"
    
        Scenario: User login to Sauce Demo
            
            Given driver 'https://www.saucedemo.com/'
             When input('#user-name','standard_user' )
              And input('#password','secret_sauce')
              And delay(3000)
              And click('#login-button')
             Then waitForUrl('https://www.saucedemo.com/inventory.html')
              And delay(3000)
              And def bag_price = text("//*[@id='inventory_container']/div/div[1]/div[2]/div[2]/div/text()[2]")
              And match bag_price == '29.99'
              And delay(3000)

              