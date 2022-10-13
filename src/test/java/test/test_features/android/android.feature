@android_sample_test
Feature:  Simple test with appium
#  Background: App Preset

  Scenario: launch chrome in appium
    * configure driver =
    """
    {
        type: 'android',
        webDriverPath : "/wd/hub",
        start: false,
        httpConfig : { readTimeout: 120000 }
    }
    """
    * def desiredConfig =
    """
     {
     "app":"/home/yabesh/Downloads/UiDemo.apk",
     "newCommandTimeout" : 300,
     "platformVersion" : "9.0",
     "platformName" : "Android",
     "connectHardwareKeyboard" : true,
     "deviceName" : "emulator-554",
     "avd": "Nexus_4_API_22",
     "automationName" : "UiAutomator2",
     }
    """
    * driver { webDriverSession: { desiredCapabilities : "#(desiredConfig)"} }
    * delay(5000).screenshot()
    * delay(2500)
    * close()

#@android_test
#Feature: android test for API Demo App
#  Background: App Preset
#    * configure driver = { type: 'android', webDriverPath : "/wd/hub", start: false, httpConfig : { readTimeout: 120000 }}
#    * def desiredConfig =
#    """
#      {
#      "app" : "https://github.com/appium/appium/raw/master/sample-code/apps/ApiDemos-debug.apk",
#      "newCommandTimeout" : 300,
#      "platformVersion" : "11.0",
#      "platformName" : "Android",
#      "unicodeKeyboard" : true,
#      "deviceName" : "emulator-5554",
#      "and" : "<YOUR_AVD>",
#      "automationName" : "UiAutomator2"
#     }
#    """
#
#  Scenario: android mobile app UI tests
#    Given driver { webDriverSession: { desiredCapabilities : "#(desiredConfig)"} }
#    And driver.optional('@Views').click()
#    And driver.script("mobile: scroll", { "strategy" : "accessibility id", "selector": "Lists"})
#    And driver.optional('@Lists').click()
#    And driver.script("mobile: scroll", { "strategy" : "accessibility id", "selector": "17. Activate items"})
#    And driver.optional('@17. Activate items').click()
#    And driver.script("mobile: scroll", { "strategy" : "-android uiautomator", "selector": ".text(\"Blue\").className(\"android.widget.TextView\")"})
#    And driver.optional("-.text(\"Blue\").className(\"android.widget.TextView\")").click()
#@android_test
#Feature: android test
#  Background: App Preset
#    * configure driver = { type: 'android', webDriverPath : "/wd/hub", start: false, httpConfig : { readTimeout: 120000 }}
#
#  Scenario: android mobile app UI tests
#    Given driver { webDriverSession: { desiredCapabilities : "#(android.desiredConfig)"} }
#    And driver.click('#com.bs.droidaction:id/showTextCheckBox')
#    And driver.clear('#com.bs.droidaction:id/showTextOnDelay').input("10000")
#    And driver.input('#com.bs.droidaction:id/editTextBox', "KarateDSL")
#    And driver.click('#com.bs.droidaction:id/showTextCheckBox')
#    And retry(10, 1000).waitForAny("#com.bs.droidaction:id/nameTextView", "//android.widget.TextView[@text='KarateDSL']")
#    Then match driver.text('#com.bs.droidaction:id/nameTextView') == 'KarateDSL'
#    And driver.click('#com.bs.droidaction:id/showTextCheckBox')
#    And assert (optional('#com.bs.droidaction:id/nameTextView').present != true)