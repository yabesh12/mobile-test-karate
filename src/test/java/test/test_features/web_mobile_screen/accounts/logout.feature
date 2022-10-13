@mobile_test
@account
Feature: NueGo (Greencell) User Logout Test

  Background:
    * def driverConfig = { type: 'chrome', showDriverLog: true, addOptions: [ "--window-size=360,740", "--disable-geolocation", "--incognito" ] }
#    * configure driver = { type: 'chrome', addOptions: ['--incognito', '--disable-geolocation'] }
    * configure driver = driverConfig

  @mobile_logout_user
  Scenario: User Logout NueGo Web test
    # Background URL
    Given driver 'https://greencell-nuego-web.web.app/'
    * maximize()
    # Login with mobile number
    And click("//img[@class='display-block margin-left-18 cursor-pointer']")
#    And click("//p[@class='ubuntu-700w-18s-28h cursor-pointer mb-0   active-tab']")
    And input("input[placeholder='Enter your number']", '9677971057', 50)
    * delay(1000).screenshot()
    When click("//button[@class='teal-22BBB0-bg submit-button w-100 mb-3']")
    # Input valid OTP
    * def elements = locateAll("//input[@maxlength='1']")
    * match karate.sizeOf(elements) == 4
    * delay(35000)
    * delay(1000).screenshot()
    When click("//button[@class='teal-22BBB0-bg white-color open-600w-16s-24h p-3 w-100 submit-button mb-3']")
    # Then Expect the message
    * dialog(true, 'Successfully Login')
    * delay(3000)
    # Logout
    * scroll('{p}Logout')
    * delay(2000)
    And click('{p}Logout')
    * delay(3000).screenshot()
    * close()






