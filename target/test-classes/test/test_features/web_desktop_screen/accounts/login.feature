@desktop_test
@account
Feature: NueGo (Greencell) User Login Test

  Background:
    * configure driver = { type: 'chrome' }

  @desktop_login_invalid_otp
  Scenario: User Login with invalid otp in NueGo Web test
    # Background URL
    Given driver 'https://greencell-nuego-web.web.app/'
    * maximize()
    # Login with mobile number
    And click("//img[@class='display-block margin-left-18 cursor-pointer']")
#    And click("//p[@class='ubuntu-700w-18s-28h cursor-pointer mb-0   active-tab']")
    And input("input[placeholder='Enter your number']", '8687848784', 50)
    * delay(1000).screenshot()
    When click("//button[@class='teal-22BBB0-bg submit-button w-100 mb-3']")
    # Input invalid OTP
    * def elements = locateAll("//input[@style='width: 48px; text-align: center; height: 48px; margin-top: 0px; margin-left: 0px; margin-right: 0.5rem; font-size: 16px; font-weight: 500; border-radius: 12px; outline: none; background-color: transparent;']")
    * match karate.sizeOf(elements) == 4
    * elements[0].click().input('1')
    * elements[1].click().input('2')
    * elements[2].click().input('3')
    * elements[3].click().input('4')
    * delay(1000).screenshot()
    When click("//button[@class='teal-22BBB0-bg white-color open-600w-16s-24h p-3 w-100 submit-button mb-3']")
    # Then Expect the error message
    * dialog(true, 'Incorrect OTP')
    * delay(1000).screenshot()
    * close()

  @desktop_login_valid_otp
  Scenario: User Login with valid otp in NueGo Web test
    # Background URL
    Given driver 'https://greencell-nuego-web.web.app/'
    * maximize()
    # Login with mobile number
    And click("//img[@class='display-block margin-left-18 cursor-pointer']")
    And click("//p[@class='ubuntu-700w-18s-28h cursor-pointer mb-0   active-tab']")
    And input("input[placeholder='Enter your number']", '9677971057', 50)
    * delay(1000).screenshot()
    When click("//button[@class='teal-22BBB0-bg submit-button w-100 mb-3']")
    # Input valid OTP
    * def elements = locateAll("//input[@maxlength='1']")
    * match karate.sizeOf(elements) == 4
    * delay(35000)
    * delay(1000).screenshot()
    When click("//button[@class='teal-22BBB0-bg white-color open-600w-16s-24h p-3 w-100 submit-button mb-3']")
    # Then Expect the Success message
    * dialog(true, 'Successfully Login')
    * delay(1000).screenshot()
    * close()






