#encoding: utf-8 
#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "table"))
#include Table

Dado(/^que (?:|eu) acesse o (.+)$/) do |page_name|
  visit path_to(page_name)
end

Quando(/^eu informar no campo "([^"]*)" com "([^"]*)"$/) do |field, value|
   fill_in(field, :with => value)
end

E(/^clicar no botão "([^"]*)"$/) do |field|
  click_button(field)
end

Então(/^deveria visualizar "([^"]*)" em Home do painel e capturar screenshot$/) do |text|
  expect(page).to have_content(text)
  Capybara::Screenshot.screenshot_and_save_page 
end

E(/^ao acessar a página deveria visualizar o label e capturar screenshot$/) do |table|
    data =  retorna_tabela_hash(table)
    count = data['page'].size.to_i
    count.times do | vnum |
      case data['page'][vnum].to_s 
        when "perfil-do-cliente"
          first(:href, data['page'][vnum].to_s).click
          expect(page).to have_content(data['result'][vnum].to_s) 
          Capybara::Screenshot.screenshot_and_save_page 
        when "detalhes-do-pedido"
          find_by_id("start-date").click
          page.execute_script("$('#start-date').removeAttr('readonly')")
          fill_in('start-date', :with => "09/07/2015")
          click_button("btn-ok-datepicker")
          first(:href, data['page'][vnum].to_s).click
          expect(page).to have_content(data['result'][vnum].to_s) 
          Capybara::Screenshot.screenshot_and_save_page 
        when "campanhas"
          visit path_to(data['page'][vnum].to_s)
          within_frame 0 do
            expect(page).to have_content(data['result'][vnum].to_s)
          end
        else 
          visit path_to(data['page'][vnum].to_s) 
          expect(page).to have_content(data['result'][vnum].to_s) 
          Capybara::Screenshot.screenshot_and_save_page     
      end    
  end
end