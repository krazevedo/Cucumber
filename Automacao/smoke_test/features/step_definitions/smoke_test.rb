#encoding: utf-8 
#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Dado(/^que (?:|eu) acesse o (.+)$/) do |page_name|
  visit path_to(page_name)
end

Quando(/^eu informar no campo "([^"]*)" com "([^"]*)"$/) do |field, value|
   fill_in(field, :with => value)
end

Quando(/^clicar no botão "([^"]*)"$/) do |field|
  click_button(field)
end

Então(/^deveria visualizar "([^"]*)" em Home do painel$/) do |text|
  expect(page).to have_content(text)
end

E(/^capturar screenshot$/) do
  Capybara::Screenshot.screenshot_and_save_page
end

Quando(/^(?:|eu) acessar a (.+)$/) do |page_name|
  visit path_to(page_name)
end

Então(/^deveria vizualizar "([^"]*)" na página$/) do |text|
  expect(page).to have_content(text)
end

Então(/^deveria vizualizar "([^"]*)" no iframe$/) do |text|
  within_frame 0 do
    expect(page).to have_content(text)
  end
end

Quando(/^eu selecionar um "([^"]*)" no grid$/) do |value|
  first(:href, value).click
end

Quando(/^eu selecionar o "([^"]*)" no datapicker$/) do |field|
  find_by_id(field).click
end

Quando(/^eu selecionar o mês "([^"]*)" no datapicker$/) do |value|
  find(:css, 'tr > th.datepicker-switch', :text => value).click
end

Quando(/^eu selecionar o dia "([^"]*)" no datapicker$/) do |value|
  find(:css, 'table > tbody > tr > td', :exact => value).css.click
end

Quando(/^eu clicar no botão "([^"]*)" no datapicker$/) do |field|
  click_button(field)
end
