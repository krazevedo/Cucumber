#encoding: utf-8 
#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "table"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "helper"))
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

Então(/^deveria visualizar "([^"]*)" na Home e capturar screenshot$/) do |text|
  expect(page).to have_content(text)
  Capybara::Screenshot.screenshot_and_save_page 
end

E(/^ao acessar a página deveria visualizar o label e capturar screenshot$/) do |table|
    data =  retorna_tabela_hash(table)
    count = data['page'].size.to_i
    count.times do | vnum |
      case data['page'][vnum].to_s 
        when "perfil-do-cliente"
          grid_assert_screenshot(data['page'][vnum].to_s, data['result'][vnum].to_s)
        when "detalhes-do-pedido"
          date_to_datapicker("09/07/2015")        
          grid_assert_screenshot(data['page'][vnum].to_s, data['result'][vnum].to_s)         
        when "campanhas"
          visit path_to(data['page'][vnum].to_s)
          within_frame 0 do
            assert_screenshot(data['result'][vnum].to_s)
          end
        else 
          visit path_to(data['page'][vnum].to_s) 
          assert_screenshot(data['result'][vnum].to_s)    
      end    
  end
end