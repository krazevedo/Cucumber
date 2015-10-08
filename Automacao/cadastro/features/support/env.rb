 require 'capybara/cucumber'
 require 'selenium-webdriver'
 require 'gherkin'
 require 'capybara-screenshot/cucumber'
 require 'yaml'  
 require 'pry'
 require 'faker'
 require 'faker_credit_card'
 require 'cpf_faker'

#  Capybara.register_driver :chrome do |app|
#   # optional
#   client = Selenium::WebDriver::Remote::Http::Default.new
#   # optional
#   client.timeout = 120
#   Capybara::Selenium::Driver.new(app, :browser => :chrome, :http_client => client)
# end

#Capybara.javascript_driver = :chrome
 
 Capybara.default_driver = :selenium
 Capybara.default_wait_time = 20
 Capybara.javascript_driver = :webkit
 Capybara.page.driver.browser.manage.window.maximize

 Capybara::Screenshot.autosave_on_failure = false

ENV['TEST_ENV'] ||= 'qxx-bra'
project_root = File.expand_path('../..', __FILE__)
$BASE_URL = YAML.load_file(project_root + "/config/config.yml")[ENV['TEST_ENV']][:url]

