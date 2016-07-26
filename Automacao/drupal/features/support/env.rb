 require 'capybara/cucumber'
 require 'selenium-webdriver'
 require 'gherkin'
 require 'capybara-screenshot/cucumber'
 require 'yaml'  
 require 'pry'
 require 'faker'
 require 'faker_credit_card'

 Capybara.register_driver :slow_selenium do |app|
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 240
  Capybara::Selenium::Driver.new(app, http_client: client)
end
 
 Capybara.default_driver = :slow_selenium
 Capybara.default_wait_time = 20
 Capybara.javascript_driver = :webkit
 Capybara.page.driver.browser.manage.window.maximize

 Capybara::Screenshot.autosave_on_failure = true

ENV['TEST_ENV'] ||= 'abae'
project_root = File.expand_path('../..', __FILE__)
$BASE_URL = YAML.load_file(project_root + "/config/config.yml")[ENV['TEST_ENV']][:url]