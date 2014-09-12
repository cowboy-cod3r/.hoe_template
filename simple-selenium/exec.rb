#!/opt/apps/ruby/ruby/bin/ruby

require 'selenium-webdriver'

# ==== Description
# Wrapper around all dom related methods. The DOM action
# is passed in as a callback.  This automatically retries
# the action for 10 seconds before giving up.
#
# ==== Raises
# Raises an Exception based on the DOM action taken.
private 
  def try_dom_action()
    dom_retry_timeout = 10
    attempts = 0
    begin
      yield
    rescue Exception => err
      if attempts < dom_retry_timeout
        puts("WARN: An error occurred executing a DOM action attempt '#{attempts}' of '#{dom_retry_timeout}', trying again. " + err.message)
        attempts += 1
        sleep 0.5
        retry
      else
        puts("ERROR: An error occurred executing a DOM action. Total attempts '#{dom_retry_timeout}'")
        raise
      end
    end
  end

# Launch Firefox and go to google.com
driver = Selenium::WebDriver.for(:firefox)
driver.navigate.to('http://google.com')

# Enter Text and press enter
try_dom_action do
  element = driver.find_element(:xpath, "//input[@id='gbqfq']") 
  element.clear()
  element.send_keys("Sean Humbarger")
  element.send_keys(:enter)
  sleep 0.5
end
