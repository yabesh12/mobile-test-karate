@mobile_test
@account
Feature: NueGo (Greencell) User Signup Test

  Background:
    * def driverConfig = { type: 'chrome', showDriverLog: true, addOptions: [ "--window-size=360,740", "--disable-geolocation", "--incognito" ] }
#    * configure driver = { type: 'chrome', addOptions: ['--incognito', '--disable-geolocation'] }
    * configure driver = driverConfig

  @mobile_signup_invalid_otp
  Scenario: User Signup with Invalid otp in NueGo Web test
    # Background URL
    Given driver 'https://greencell-nuego-web.web.app/'
    # Signup name, mobile number
    And click("//img[@src='/static/media/Notification.f0b5e2f7e46ed78b5454775fe36aafb0.svg']")
#    And click("//p[@class='ubuntu-700w-18s-28h cursor-pointer mb-0  in-active-tab']")
    * delay(1000)
    And input("input[placeholder='Enter your number']", '8684878587', 50)
    * delay(1000).screenshot()
    When click("//button[@class='teal-22BBB0-bg submit-button w-100 mb-3']")
    * delay(1000)
    # Input invalid OTP
    * def inputs = locateAll("//input[@type='number']")
    * match karate.sizeOf(inputs) == 4
    * delay(1000).screenshot()
    * inputs[0].click().input('1')
    * inputs[1].click().input('2')
    * inputs[2].click().input('3')
    * inputs[3].click().input('4')
    * delay(1000).screenshot()
    And click('{button}Submit')
    # Then Expect the Error message
    * dialog(true, 'Invalid OTP')
    * delay(1000).screenshot()
    * close()

  @mobile_signup_valid_otp
  Scenario: User Signup with valid otp in NueGo Web test
    # Background URL
    Given driver 'https://greencell-nuego-web.web.app/'
    # Signup name, mobile number
    And click("//img[@src='/static/media/Notification.f0b5e2f7e46ed78b5454775fe36aafb0.svg']")
#    And click("//p[@class='ubuntu-700w-18s-28h cursor-pointer mb-0  in-active-tab']")
    * delay(1000)
    And input("input[placeholder='Enter your number']", '9677971057', 50)
    * delay(1000).screenshot()
    When click("//button[@class='teal-22BBB0-bg submit-button w-100 mb-3']")
    * delay(1000)
    # Input valid OTP
    * def inputs = locateAll("//input[@type='number']")
    * match karate.sizeOf(inputs) == 4
    * delay(30000)
    * delay(1000).screenshot()
    And click('{button}Submit')
    # Then Expect the Success message
    * dialog(true, 'Successfully logged in')
    * delay(1000).screenshot()
    * close()






