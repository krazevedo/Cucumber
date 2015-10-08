#encoding: utf-8 
#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "table"))


Quando(/^eu acessar (.+)$/) do |page_name|
	visit path_to(page_name)
end


Quando(/^atualizar o campo "([^"]*)" com "([^"]*)"$/) do |field, value|
  	find("input[name=#{field}]").click  
  	fill_in(field, :with => value)  
end


Quando(/^atualizar o campo "([^"]*)"$/) do |field|
	case field
		when "phone"
				value = Faker::PhoneNumber.subscriber_number(10)
		when "cardNumber"
				value = Faker::CreditCard.number(:master_card)
		when "cardName"
				value = Faker::Name.name
		else value = ""
	end
  	find("input[name=#{field}]").click  
  	fill_in(field, :with => value)  
end

Quando(/^clicar no link "([^"]*)"$/) do |link|
  find(:href, link).click
end

Então(/^deverá ser atualizado com sucesso$/) do
  	expect(page).to have_content("Dados atualizados com sucesso")
end

Então(/^"([^"]*)" deverá ser atualizada com "([^"]*)"$/) do |field, value|
	page.find("input[name=#{field}]").value == value																																																																								  	
end

Quando(/^selecionar o mês "([^"]*)" e o ano "([^"]*)"$/) do |month, year|
	select(month, :from => 'expirationMonth')
	select(year, :from => 'expirationYear' )  
end
