@desktop_test
Feature: NueGo (Greencell) Bus Booking Test

  Background:
#    * def driverConfig = { type: 'chrome', showDriverLog: true, addOptions: [ "--window-size=360,740", "--disable-geolocation", "--incognito" ] }
    * configure driver = { type: 'chrome', addOptions: ['--incognito', '--disable-geolocation'] }
#    * configure driver = driverConfig


  @desktop_invalid_booking_without_seat
  Scenario: Bus Booking with Invalid data without selecting seat in NueGo Web test
    # Background URL
    Given driver 'https://greencell-nuego-web.web.app/'
    * maximize()

    # Bus Listing
    * delay(2000)
    * input('body', Key.ESCAPE)
    * delay(2000).screenshot()
    * delay(1000).screenshot()
    * script("console.log('helllo world')")

    * delay(2000)
    And input('#search-source', 'New Delhi',50)
    And input('#search-destination', 'Amritsar',50)
    And click("//div[@class='Tomorrow']")
    * delay(1000)
    And click("//img[@class='Search ']")
    # Bus Listing
    Then waitForUrl('https://greencell-nuego-web.web.app/booking')
    * delay(1000)
    Then match driver.url == 'https://greencell-nuego-web.web.app/booking'
    * delay(2000).screenshot()
    # Booking
    * scroll('{p}Boarding point')
    * def checkboxes = locateAll("//div[@class='d-flex mb-3']")
    * checkboxes[0].click()
    * delay(1000)
    * def searchpoints = locateAll("//p[@class='border-less-input mb-0']")
    * searchpoints[0].click()
    And click('{p}ISBT Kashmere Gate')
    * mouse().move('{p}Boarding point')
    * def checkboxes = locateAll("//div[@class='d-flex mb-3']")
    * checkboxes[1].click()
    * def searchpoints = locateAll("//p[@class='border-less-input mb-0']")
    * searchpoints[1].click()
    And click('{p}ISBT Amritsar')
    * delay(1000)
    And click('{p}Select Seats')
    * delay(2000)
    And click("//button[@class='submit-button ubuntu-500w-18s-28h w-100 py-3 mt-3 ']")
    Then match text('{p}You have to select 1 seats') == 'You have to select 1 seats'
    * delay(2000).screenshot()
    * close()


  @desktop_invalid_booking_without_pickup
  Scenario: Bus Booking with Invalid data without pickup point in NueGo Web test
    # Background URL
    Given driver 'https://greencell-nuego-web.web.app/'
    * maximize()

    # Bus Listing
    * delay(1000)
    * input('body', Key.ESCAPE)
    * delay(2000).screenshot()
    * delay(1000).screenshot()
    * script("console.log('helllo world')")

    * delay(2000)
    And input('#search-source', 'New Delhi',50)
    And input('#search-destination', 'Amritsar',50)
    And click("//div[@class='Tomorrow']")
    * delay(1000)
    And click("//img[@class='Search ']")
    # Bus Listing
    Then waitForUrl('https://greencell-nuego-web.web.app/booking')
    * delay(1000)
    Then match driver.url == 'https://greencell-nuego-web.web.app/booking'
    * delay(2000).screenshot()
    # Booking
    * scroll('{p}Boarding point')
    * def checkboxes = locateAll("//div[@class='d-flex mb-3']")
    * checkboxes[0].click()
    * delay(1000)
    * def searchpoints = locateAll("//p[@class='border-less-input mb-0']")
    * searchpoints[0].click()
    And click('{p}ISBT Kashmere Gate')
    * mouse().move('{p}Boarding point')
    * def checkboxes = locateAll("//div[@class='d-flex mb-3']")
    * checkboxes[1].click()
    * def searchpoints = locateAll("//p[@class='border-less-input mb-0']")
    * searchpoints[1].click()
    And click('{p}ISBT Amritsar')
    * delay(1000)
    And click('{p}Select Seats')
    * delay(2000)
#    And click("//div[@class='p-3 d-flex justify-content-between']")
    * delay(2000).screenshot()
    And click('{p}Dropping Point')
    * def seats = locateAll("//div[@class=' w-fit-content seat-listing-seat']")
    * match karate.sizeOf(seats) == 55
    * seats[1].click()
    And click("//div[@class='p-3 d-flex justify-content-between']")
    * delay(2000)
    And click('{button}Book & Pay')
    * delay(2000)
    Then match text('{p}You have to select boarding point') == 'You have to select boarding point'
    * delay(2000).screenshot()
    * close()

  @desktop_invalid_booking_without_drop
  Scenario: Bus Booking with Invalid data without drop point in NueGo Web test
    # Background URL
    Given driver 'https://greencell-nuego-web.web.app/'
    * maximize()

    # Bus Listing
    * delay(1000)
    * input('body', Key.ESCAPE)
    * delay(2000).screenshot()
    * delay(1000).screenshot()
    * script("console.log('helllo world')")

    * delay(2000)
    And input('#search-source', 'New Delhi',50)
    And input('#search-destination', 'Amritsar',50)
    And click("//div[@class='Tomorrow']")
    * delay(1000)
    And click("//img[@class='Search ']")
    # Bus Listing
    Then waitForUrl('https://greencell-nuego-web.web.app/booking')
    * delay(1000)
    Then match driver.url == 'https://greencell-nuego-web.web.app/booking'
    * delay(2000).screenshot()
    # Booking
    * scroll('{p}Boarding point')
    * def checkboxes = locateAll("//div[@class='d-flex mb-3']")
    * checkboxes[0].click()
    * delay(1000)
    * def searchpoints = locateAll("//p[@class='border-less-input mb-0']")
    * searchpoints[0].click()
    And click('{p}ISBT Kashmere Gate')
    * mouse().move('{p}Boarding point')
    * def checkboxes = locateAll("//div[@class='d-flex mb-3']")
    * checkboxes[1].click()
    * def searchpoints = locateAll("//p[@class='border-less-input mb-0']")
    * searchpoints[1].click()
    And click('{p}ISBT Amritsar')
    * delay(1000)
    And click('{p}Select Seats')
    * delay(2000)
#    And click("//div[@class='p-3 d-flex justify-content-between']")
    * delay(2000).screenshot()
    And click('{p}ISBT Kashmere Gate')
    * mouse().move('{p}Boarding point')
    * def seats = locateAll("//div[@class=' w-fit-content seat-listing-seat']")
    * seats[1].click()
    * match karate.sizeOf(seats) == 55
    And click("//div[@class='p-3 d-flex justify-content-between']")
    * delay(2000)
    And click('{button}Book & Pay')
    * delay(2000)
    Then match text('{p}You have to select dropping point') == 'You have to select dropping point'
    * delay(2000).screenshot()
    * close()


  @desktop_invalid_booking_without_ps_name
  Scenario: Bus Booking with Invalid data without drop point in NueGo Web test
    # Background URL
    Given driver 'https://greencell-nuego-web.web.app/'
    * maximize()

    # Bus listing
    * waitUntil("document.readyState == 'complete'")
    And input('#search-source', 'New Delhi',60)
    And input('#search-destination', 'Amritsar',60)
    * delay(1000)
    And click("//div[@class='Tomorrow']")
    * delay(1000)
    And click("//img[@class='Search ']")
    * delay(3000)
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
    * delay(2000).screenshot()
    * scroll('{button}Book & Pay')
    * delay(1000)
    And click("//button[@class='submit-button ubuntu-500w-18s-28h w-100 py-3 mt-3 ']")
    * delay(2000).screenshot()
    * waitForUrl('/booking-details')
    * delay(1000)
#     Add passenger 1
#    * def passengers = locateAll("//input[@class='border-less-input w-100']")
#    * match karate.sizeOf(passengers) == 4
#    * passengers[0].click().input('selvam')
    * def ages = locateAll("//input[@class='border-less-input']")
    * ages[0].click().input('28')
    * def gender = locateAll("//p[@class='open-600w-16s-24h ']")
    * match karate.sizeOf(gender) == 2
    * gender[0].click()
    * delay(2000).screenshot()
    * scroll('{p}Contact Details')
    * delay(1000)
    * def mobile = locateAll("//input[@class='border-less-input w-100 ']")
    * mobile[0].click().input('9677971057')
    * delay(1000)
    * def email = locateAll("//input[@type='email']")
    * email[0].click().input('samyabeshv@gmail.com')
    * delay(2000).screenshot()
    * def mobile = locateAll("//input[@class='border-less-input w-100 ']")
    * mobile[0].click().input('9677971057')
    * delay(500)
#    And click("//div[@class=' d-flex align-items-center p-3 w-fit-content  common-input-wrap']")
#    * delay(1000)
#    * mouse('.ubuntu-700w-18s-28h').click()
#    * delay(1000)
    And click("//button[@class='teal-22BBB0-bg cursor-pointer white-color submit-button text-center open-600w-16s-24h py-3']")
    * delay(8000).screenshot()
    # Payment page
    Then waitForUrl('https://uat.pinepg.in/card')
    And click('{span}Net Banking')
    And click('{span}IDBI Bank')
    And click("//button[@class='btn btn-green mr-3']")
    * delay(7000)
    Then waitForUrl('https://uat.billdesk.com/pgidsk/pgijsp/banksimulator.jsp')
    When waitFor('#BankStatus').click()
    And select('#BankStatus', '{}Success')
    And click('#SubmitForm')
    * delay(9000).screenshot()
    * close()