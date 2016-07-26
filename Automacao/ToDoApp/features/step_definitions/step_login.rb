#encoding: utf-8 
#!/usr/bin/env ruby

Given(/^I access "([^"]*)"$/) do |url|
	visit path_to(url)
end

When(/^I fill "([^"]*)" and "([^"]*)"$/) do |arg1, arg2|
	@login = LoginPage.new
	@login.load
	@login.login(arg1, arg2)
end

Then(/^I should to login in the system$/) do
	@home = HomePage.new
	expect(@home.message_success).to have_text('Signed in successfully.')
end

Then(/^I fill user and password and I should to see error message$/) do |table|
	validade_invalid_login(table)
end

