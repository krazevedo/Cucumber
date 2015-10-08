#encoding: utf-8 
#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "table"))

Dado(/^que (?:|eu) acesse o (.+)$/) do |page_name|
  visit path_to(page_name)
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

E(/^capturar screenshot$/) do
  Capybara::Screenshot.screenshot_and_save_page
end

Quando(/^eu informar login e senha inválidos apresentará mensagem de erro$/) do |table|
   data =  retorna_tabela_hash(table)
    count = data['login'].size.to_i
    count.times do | vnum |
       fill_in("uEmail", :with => data['login'][vnum].to_s)
       fill_in("uPassword", :with => data['password'][vnum].to_s)
       click_button("okButton")
       expect(page).to have_content(data['result'][vnum].to_s)
  end
end