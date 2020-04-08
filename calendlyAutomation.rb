require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'

class CalendlyAutomation < Test::Unit::TestCase

  def test_01_e2e

    Selenium::WebDriver::Chrome::Service.driver_path ="/Users/jovankbrown/RubymineProjects/calendlyAutomation/Driver/chromedriver 2"
    driver = Selenium::WebDriver.for :chrome
    driver.get("https://codepen.io/CalendlyQA/full/KKPQLmV")
    tttInput = 3
    puts "input number #{tttInput}"
    sleep(1)
    puts "pageTitle = #{driver.title}"
    assert_equal('QA Interview Assignment',driver.title,'Page is as expected')

    driver.switch_to.frame driver.find_element(id: 'result')

    assert_true(driver.find_element(:id, "number").displayed?, 'Textbox not found')
    driver.find_element(:id, "number").clear()
    driver.find_element(:id, "number").send_keys("3")

    assert_true(driver.find_element(:id, "start").displayed?, 'Play Button not found')
    driver.find_element(:id, "start").click()
    sleep(1)

    assert_true(driver.find_element(:css,'#table').displayed?, 'Tic Tac Toe Table not found')
    sleep(1)

  end


  def test_02_Validations

    Selenium::WebDriver::Chrome::Service.driver_path ="/Users/jovankbrown/RubymineProjects/calendlyAutomation/Driver/chromedriver 2"
    driver = Selenium::WebDriver.for :chrome
    driver.get("https://codepen.io/CalendlyQA/full/KKPQLmV")
    tttInput = 3
    puts "input number #{tttInput}"
    sleep(1)
    puts "pageTitle = #{driver.title}"
    assert_equal('QA Interview Assignment',driver.title,'Page is as expected')

    driver.switch_to.frame driver.find_element(id: 'result')

    assert_true(driver.find_element(:id, "number").displayed?, 'Textbox not found')
    driver.find_element(:id, "number").clear()
    driver.find_element(:id, "number").send_keys("3")

    assert_true(driver.find_element(:id, "start").displayed?, 'Play Button not found')
    driver.find_element(:id, "start").click()
    sleep(1)

    ttt_NumberOfColumns = driver.find_elements(:css,'#table tr').size()
    puts "columns = " + ttt_NumberOfColumns.to_s()
    assert_equal(tttInput,ttt_NumberOfColumns, 'The number of columns are incorrect')

    ttt_NumberOfRows = driver.find_elements(:css,'#table tr td').size()
    puts "rows = " + (ttt_NumberOfRows/tttInput).to_s()
    assert_equal(tttInput,ttt_NumberOfRows/tttInput, 'The number of columns are incorrect')

    sleep(1)

  end

  def test_03_winningMessage

    Selenium::WebDriver::Chrome::Service.driver_path ="/Users/jovankbrown/RubymineProjects/calendlyAutomation/Driver/chromedriver 2"
    driver = Selenium::WebDriver.for :chrome
    driver.get("https://codepen.io/CalendlyQA/full/KKPQLmV")
    tttInput = 3
    puts "input number #{tttInput}"
    sleep(1)
    puts "pageTitle = #{driver.title}"
    assert_equal('QA Interview Assignment',driver.title,'Page is as expected')

    driver.switch_to.frame driver.find_element(id: 'result')

    assert_true(driver.find_element(:id, "number").displayed?, 'Textbox not found')
    driver.find_element(:id, "number").clear()
    driver.find_element(:id, "number").send_keys("3")

    assert_true(driver.find_element(:id, "start").displayed?, 'Play Button not found')
    driver.find_element(:id, "start").click()
    sleep(1)

    ttt_NumberOfColumns = driver.find_elements(:css,'#table tr').size()
    puts "columns = " + ttt_NumberOfColumns.to_s()
    assert_equal(tttInput,ttt_NumberOfColumns, 'The number of columns are incorrect')

    ttt_NumberOfRows = driver.find_elements(:css,'#table tr td').size()
    puts "rows = " + (ttt_NumberOfRows/tttInput).to_s()
    assert_equal(tttInput,ttt_NumberOfRows/tttInput, 'The number of columns are incorrect')

    sleep(1)

    options = driver.find_elements(:css,'#table tr td')
    puts "boxes = " + options.size().to_s()
    for i in 0..(options.size()-1)
      if driver.find_element(:css, "div#endgame").displayed? then
        break
      end
      driver.find_element(:css,"#table tr td[id='#{i}']").click()
      sleep(1)
      puts "#table tr td[id='#{i}']"
    end
    assert_equal('Congratulations player X! You\'ve won. Refresh to play again!',driver.find_element(:css, "div#endgame").text,'Text response is not correct')
    sleep(1)

  end

  end
