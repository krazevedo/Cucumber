#encoding: utf-8 
#!/usr/bin/env ruby

Quando(/^filtrar um refund por data$/) do
	wait_for_allow
	sleep(5)
	find('div > button.md-icon-button.md-ink-ripple').click
	find('form > div > div:nth-child(1) > md-datepicker > div.md-datepicker-input-container > input').set(Date.today.strftime('%m/%d/%Y'))
	sleep(0.5)
	click_button('Filter')
end

Quando(/^filtrar um refund por tipo$/) do
  	@type = 'Books'
  	wait_for_allow
  	sleep(5)
	find('div > button.md-icon-button.md-ink-ripple').click
	find('md-select', :text => 'Types').click
	find('md-option > div.md-text.ng-binding', :text => @type).click
	click_button('Filter')
end

Quando(/^filtrar um refund por moeda$/) do
	@currency = 'BRL'
	wait_for_allow
	sleep(5)
	find('div > button.md-icon-button.md-ink-ripple').click
	find('md-select', :text => 'Currency').click
	find('md-option > div.md-text.ng-binding', :text => @currency).click
	click_button('Filter')
end

Então(/^resultado por "([^"]*)" deverá ser apresentado com sucesso$/) do |filtro|
	sleep(5)
	dados = Array.new
	result = all("md-tab-content#tab-content-1 > div > ng-include > md-content > md-card > md-table-container > table > tbody > tr").count
	i = 1
	case filtro
	when "data"
	  for i in 1..result do
	  	dados += [find("tr:nth-child(#{i}) > td:nth-child(3)").text]
	  end 
	  dados.each {|x| expect(x).to eq Date.today.strftime('%m/%d/%Y')}  
	when "tipo"
	  for i in 1..result do
	  	dados += [find("tr:nth-child(#{i}) > td:nth-child(2)").text.split(" ")[0]]
	  end 
	  dados.each {|x| expect(x).to eq @type.split(" ")[0]} 
	when "moeda"
	  for i in 1..result do
	  	dados += [find("tr:nth-child(#{i}) > td:nth-child(7)").text.split(" ")[0]]
	  end 
	  dados.each {|x| expect(x).to eq @currency.split(" ")[0]} 
	end	
end
