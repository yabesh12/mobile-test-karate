@desktop_test
@account
Feature: NueGo (Greencell) User Signup Test

  Background:
    * configure driver = { type: 'chrome' }

  @desktop_signup_invalid_otp
  Scenario: User Signup with invalid otp in NueGo Web test
    # Background URL
    Given driver 'https://greencell-nuego-web.web.app/'
    * maximize()
    # Signup name, mobile number
    And click("//img[@class='display-block margin-left-18 cursor-pointer']")
    And click("//p[@class='ubuntu-700w-18s-28h cursor-pointer mb-0  in-active-tab']")
    And input("input[placeholder='Enter your Name']", 'selvam', 50)
#    8527834259
    And input("input[placeholder='Enter your number']", '8785874875', 50)
    * delay(1000).screenshot()
    When click("//button[@class='teal-22BBB0-bg submit-button w-100 mb-3']")
    # Input invalid OTP
    * def elements = locateAll("//input[@max='9']")
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

  @desktop_signup_valid_otp
  Scenario: User Signup with valid otp in NueGo Web test
    # Background URL
    Given driver 'https://greencell-nuego-web.web.app/'
    * maximize()
    # Signup name, mobile number
    And click("//img[@class='display-block margin-left-18 cursor-pointer']")
    And click("//p[@class='ubuntu-700w-18s-28h cursor-pointer mb-0  in-active-tab']")
    And input("input[placeholder='Enter your Name']", 'selvam', 50)
    And input("input[placeholder='Enter your number']", '9677971057', 50)
    * delay(1000).screenshot()
    When click("//button[@class='teal-22BBB0-bg submit-button w-100 mb-3']")
    # Input invalid OTP
    * def elements = locateAll("//input[@max='9']")
    * match karate.sizeOf(elements) == 4
    * delay(35000)
    * delay(1000).screenshot()
    When click("//button[@class='teal-22BBB0-bg white-color open-600w-16s-24h p-3 w-100 submit-button mb-3']")
    # Then Expect the Success message
    * dialog(true, 'Successfully Login')
    * delay(1000).screenshot()
    * close()


  @test_case
  Scenario: Finding the Element in the page Test
    # Background URL
    Given driver 'https://greencell-nuego-web.web.app/'
    * maximize()
    # Signup name, mobile number
    And click("//img[@class='display-block margin-left-18 cursor-pointer']")
    And click("//p[@class='ubuntu-700w-18s-28h cursor-pointer mb-0  in-active-tab']")
    And input("input[placeholder='Enter your Name']", 'selvam', 60)
    And input("input[placeholder='Enter your number']", '8687878787', 60)
    * delay(1000).screenshot()
    When click("//button[@class='teal-22BBB0-bg submit-button w-100 mb-3']")
    # Input valid OTP
    * def elements = locateAll("//input[@max='9']")
    * match karate.sizeOf(elements) == 4
#    * delay(35000)
    * delay(1000).screenshot()
    * def buttonExists = exists('{button}Submit')
    * if (!buttonExists) karate.fail('Submit button does not exists!')
    * def resendOtp = exists('{p}RESEND OTP')
    * if (!resendOtp) karate.fail('Resend Otp button does not exists!')
#    * match script('.styled-div', "function(e){ return getComputedStyle(e)['font-size'] }") == '30px'
    * print script('{button}Submit', "function(e){ return getComputedStyle(e)['width'] }")
    * def buttonSize = script('{button}Submit', "function(e){ return getComputedStyle(e)['width'] }")
    Then match buttonSize == '98.4219px'
#    * print script('.teal-22BBB0-bg white-color open-600w-16s-24h p-3 w-100 submit-button mb-3', "_.style['display']")
#    * match script('{button}Submit', "function(e){ return getComputedStyle(e)['width'] }") == '98.4219px'
    When click("//button[@class='teal-22BBB0-bg white-color open-600w-16s-24h p-3 w-100 submit-button mb-3']")
    # Then Expect the Success message
    * dialog(true, 'Incorrect OTP')
    * delay(1000).screenshot()
    * close()