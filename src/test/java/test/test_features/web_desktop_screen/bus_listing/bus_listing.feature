@desktop_test
Feature: NueGo (Greencell) Bus Listing Test

  Background:
#    * def driverConfig = { type: 'chrome', showDriverLog: true, addOptions: [ "--window-size=360,740", "--disable-geolocation", "--incognito" ] }
    * configure driver = { type: 'chrome', addOptions: ['--incognito', '--disable-geolocation'] }
#    * configure driver = driverConfig


  @desktop_bus_listing
  Scenario: Bus Listing with Valid source and destination in NueGo Web test
    # Background URL
    Given driver 'https://greencell-nuego-web.web.app/'
    * maximize()

    # Bus Listing
    * delay(2000)
    * input('body', Key.ESCAPE)
    * delay(2000).screenshot()
#    * input('body', Key.TAB)
#    * input('body', Key.ENTER)
    * delay(1000).screenshot()
    * script("console.log('helllo world')")

    * delay(2000)
    And input('#search-source', 'New Delhi',50)
    And input('#search-destination', 'Amritsar',50)
    And click("//div[@class='Tomorrow']")
    * delay(1000)
    And click("//img[@class='plus']")
    And click("//img[@class='Search ']")
    Then waitForUrl('https://greencell-nuego-web.web.app/booking')
    * delay(1000)
    Then match driver.url == 'https://greencell-nuego-web.web.app/booking'
    * delay(2000).screenshot()
    * close()


  @desktop_invalid_bus_listing
  Scenario: Bus Listing with Invalid source and destination in NueGo Web test
    # Background URL
    Given driver 'https://greencell-nuego-web.web.app/'
    * maximize()

    # Bus Listing
    * delay(2000)
    * input('body', Key.ESCAPE)
    * delay(2000).screenshot()
    * input('body', Key.TAB)
    * input('body', Key.ENTER)
    * delay(1000).screenshot()
    * script("console.log('helllo world')")

    * delay(2000)
    And input('#search-source', 'Madurai',50)
    And input('#search-destination', 'Amritsar',50)
    And click("//div[@class='Tomorrow']")
    * delay(2000)
    And click("//img[@class='plus']")
    And click("//img[@class='Search ']")
    * def temp = driver.send({ method: 'Page.getFrameTree' })
    * print 'temp:', temp
    Then match text('{p}Your Source or Destination was not serviceable') == 'Your Source or Destination was not serviceable'
    * delay(2000).screenshot()
    * close()
