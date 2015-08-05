 require 'capybara/cucumber'
 require 'selenium-webdriver'
 require 'gherkin'
 require 'capybara-screenshot/cucumber'
 require 'yaml'  
 
 Capybara.default_driver = :selenium
 Capybara.default_wait_time = 20
 Capybara.javascript_driver = :webkit

 Capybara::Screenshot.autosave_on_failure = false

ENV['TEST_ENV'] ||= 'test-bra'
project_root = File.expand_path('../..', __FILE__)
$BASE_URL = YAML.load_file(project_root + "/config/config.yml")[ENV['TEST_ENV']][:url]