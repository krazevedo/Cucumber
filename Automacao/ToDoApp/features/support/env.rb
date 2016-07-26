 require 'capybara/cucumber'
 require 'selenium-webdriver'
 require 'gherkin'
 require 'capybara-screenshot/cucumber'
 require 'yaml'  
 require 'pry'
 require 'faker'
 require 'faker_credit_card'
 require 'oci8'
 require 'date'
 require 'site_prism'


if ENV['chrome']
 Capybara.default_driver = :chrome 
 Capybara.register_driver :chrome do |app|
 options = {
 :js_errors => false,
 :timeout => 360,
 :debug => false,
 :inspector => false,
 }
 Capybara::Selenium::Driver.new(app, :browser => :chrome)
 end
 Capybara::Screenshot.register_driver(:chrome) do |driver, path|
  driver.browser.save_screenshot(path)
 end
elsif ENV['selenium']
 Capybara.default_driver = :selenium
 Capybara.default_wait_time = 20
 Capybara.javascript_driver = :webkit
end

 Capybara.page.driver.browser.manage.window.maximize
 Capybara::Screenshot.autosave_on_failure = true

ENV['TEST_ENV'] ||= 'test'
project_root = File.expand_path('../..', __FILE__)
$BASE_URL = YAML.load_file(project_root + "/config/config.yml")[ENV['TEST_ENV']][:url]