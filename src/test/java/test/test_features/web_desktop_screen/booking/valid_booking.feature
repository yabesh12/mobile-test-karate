@desktop_full_web_test
Feature: NueGo (Greencell) Full Web Test

  Background:
    * configure driver = { type: 'chrome' }

  Scenario: User Login with valid otp in NueGo Web test
    # Background URL
    Given driver 'https://greencell-nuego-web.web.app/'
    * maximize()
    # Login with mobile number
    * delay(1000)
    And click("//img[@class='display-block margin-left-18 cursor-pointer']")
    And click("//p[@class='ubuntu-700w-18s-28h cursor-pointer mb-0   active-tab']")
    * delay(1000)
    And input("input[placeholder='Enter your number']", '9677971057', 60)
    * delay(1000).screenshot()
    When click("//button[@class='teal-22BBB0-bg submit-button w-100 mb-3']")
    # Input invalid OTP
    * def elements = locateAll("//input[@maxlength='1']")
    # wait 30 seconds for manually input the otp
    * delay(40000)
    * delay(1000).screenshot()
#    * eval
#      """
#      if (exists('.message open-400w-14s-22h mb-0')) karate.fail('Successfully Login'){
#        continue
#        else if{
#          break
#        }
#      }
#      """
    When click("//button[@class='teal-22BBB0-bg white-color open-600w-16s-24h p-3 w-100 submit-button mb-3']")
    # Then Expect the Success message
    * dialog(true, 'Successfully Login')
    * delay(1000).screenshot()
    # Bus Listing New delhi to Amritsar
    * delay(5000)
    * waitUntil("document.readyState == 'complete'")
    And input('#search-source', 'New Delhi',70)
    And input('#search-destination', 'Amritsar',70)
    * delay(1000)
    And click("//div[@class='Tomorrow']")
    * delay(1000)
    And click("//img[@class='plus']")
    * delay(1000)
    And click("//img[@class='Search ']")
    * delay(3000)
    # Bus listing
    * scroll('{p}Boarding point')
    * def checkboxes = locateAll("//div[@class='d-flex mb-3']")
    * checkboxes[0].click()
    * delay(1000)
    * def searchpoints = locateAll("//p[@class='border-less-input mb-0']")
    * searchpoints[0].click()
    * delay(2000)
    And click('{p}ISBT Kashmere Gate')
    * mouse().move('{p}Boarding point')
    * def checkboxes = locateAll("//div[@class='d-flex mb-3']")
    * checkboxes[1].click()
    * def searchpoints = locateAll("//p[@class='border-less-input mb-0']")
    * searchpoints[1].click()
    And click('{p}ISBT Amritsar')
    * delay(3000)
    # Select Seats
    And click('{p}Select Seats')
    * delay(2000)
    And click('{p}Pickup Point')
    * delay(2000)
    And click("//div[@class='p-3 d-flex justify-content-between']")
    * delay(2000).screenshot()
    And click('{p}Dropping Point')
    And click("//div[@class='p-3 d-flex justify-content-between']")
    * delay(2000).screenshot()
    * def seats = locateAll("//div[@class=' w-fit-content seat-listing-seat']")
    * match karate.sizeOf(seats) == 55
    * seats[11].click()
    * def seats = locateAll("//div[@class=' w-fit-content seat-listing-seat']")
    * seats[14].click()
    * delay(2000).screenshot()
    * scroll('{button}Book & Pay')
    * delay(1000)
    And click("//button[@class='submit-button ubuntu-500w-18s-28h w-100 py-3 mt-3 ']")
    * delay(2000).screenshot()
    * waitForUrl('/booking-details')
    # Add passenger 1
    * def passengers = locateAll("//input[@class='border-less-input w-100']")
    * delay(1000)
    * match karate.sizeOf(passengers) == 3
    * passengers[0].click().input('selvam')
    * delay(1000)
    * def ages = locateAll("//input[@class='border-less-input']")
    * delay(1000)
    * ages[0].click().input('28')
    * def gender = locateAll("//p[@class='open-600w-16s-24h ']")
    * delay(1000)
    * match karate.sizeOf(gender) == 4
    * gender[0].click()
    # Add passenger 2
    * def passengers = locateAll("//input[@class='border-less-input w-100']")
    * match karate.sizeOf(passengers) == 3
    * passengers[1].click().input('ganesh')
    * def ages = locateAll("//input[@class='border-less-input']")
    * ages[1].click().input('27')
    * def gender = locateAll("//p[@class='open-600w-16s-24h ']")
    * gender[2].click()
    * delay(2000).screenshot()
    * scroll('{p}Contact Details')
    * delay(1000)
    * def mobile = locateAll("//input[@class='border-less-input w-100 ']")
    * mobile[0].click().input('9677971057')
    * delay(1000)
    * def email = locateAll("//input[@type='email']")
    * email[0].click().input('samyabeshv@gmail.com')
    * delay(2000).screenshot()
    * mouse('.ubuntu-700w-18s-28h').click()
    And click("//p[@class='ubuntu-700w-18s-28h black-1E1E26-color mb-0']")
    * delay(1000)
    And click("//button[@class='teal-22BBB0-bg cursor-pointer white-color submit-button text-center open-600w-16s-24h py-3']")
    * delay(4000).screenshot()
    # Payment page
    Then waitForUrl('https://greencell-nuego-web.web.app/booking-details')
    * scroll('{p}Payment Options')
    And click("//div[@class=' d-flex align-items-center p-3 w-100  common-input-wrap']")
    * mouse('.ubuntu-700w-18s-28h').click()
    * delay(1000)
    And click("//button[@class='teal-22BBB0-bg cursor-pointer white-color submit-button text-center open-600w-16s-24h py-3']")
    * delay(6000).screenshot()
    Then waitForUrl('https://uat.pinepg.in/card')
    And click('{span}Net Banking')
    * delay(1000)
    And click('{span}IDBI Bank')
    * delay(1000)
    And click("//button[@class='btn btn-green mr-3']")
    * delay(7000)
    Then waitForUrl('https://uat.billdesk.com/pgidsk/pgijsp/banksimulator.jsp')
    When waitFor('#BankStatus').click()
    And select('#BankStatus', '{}Success')
    And click('#SubmitForm')
    * delay(9000).screenshot()
    * close()