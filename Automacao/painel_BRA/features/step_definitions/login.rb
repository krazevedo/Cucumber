#encoding: utf-8 
#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Dado(/^que (?:|eu) acesse (.+)$/) do |page_name|
  visit path_to(page_name)
end

Então(/^deveria visualizar mensagem de erro$/) do
  expect(page).to have_content 'Login ou senha inválidos.'
end

Quando(/^eu informar no campo "([^"]*)" com "([^"]*)"$/) do |field, value|
   fill_in(field, :with => value)
end

Quando(/^clicar no botão "([^"]*)"$/) do |field|
  click_button(field)
end

Então(/^deveria visualizar "([^"]*)" em Home do painel$/) do |value|
  expect(page).to have_content(value)
end

Então(/^deveria visualizar mensagem de erro "([^"]*)"$/) do |value|
  expect(page).to have_content(value)
end

E(/^capturar screenshot$/) do
  Capybara::Screenshot.screenshot_and_save_page
end