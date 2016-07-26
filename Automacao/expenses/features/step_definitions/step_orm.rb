#encoding: utf-8 
#!/usr/bin/env ruby

Quando(/^acessar última versão$/) do 
  within_frame("OperationalRiskManagementFrame") do
  		selecionar_última_versao						
	end
end

Então(/^deverá carregar corretamente as informações$/) do |table|
	within_frame("OperationalRiskManagementFrame") do
			selecionar_opcao_combobox("ORMFilter_SelectedSSO", "BR Office")
			selecionar_opcao_combobox("ORMFilter_SelectedTower", "UMKT_Agro_Chemical")
		  	clicar_no_apply
		  	validar_valores_details(table)		
	end
end

Então(/^deverá comparar corretamente as informações da "([^"]*)"$/) do |tower|
	within_frame("OperationalRiskManagementFrame") do
		has_selector?("div#ormTable")
		collums = find("div#ormTable > div > table > tbody > tr > td", :text => tower).find(:xpath, '..').all("td")
  		expect(collums[11].text).to eq $cor_execucao
		  expect(collums[12].text).to eq $cor_arquitetura
		  expect(collums[13].text).to eq $cor_gerenciamento
		  expect(collums[14].text).to eq $cor_performance
	end
end

Então(/^deverá printar resultados$/) do
	printar_grupos
end

Então(/^selecionar SSO "([^"]*)" e Tower "([^"]*)"$/) do |sso, tower|
	within_frame("OperationalRiskManagementFrame") do
		selecionar_opcao_combobox("ORMFilter_SelectedSSO", sso)
		selecionar_opcao_combobox("ORMFilter_SelectedTower", tower)
		clicar_no_apply
	end
end

Quando(/^editar última versão$/) do 
  within_frame("OperationalRiskManagementFrame") do
  		editar_última_versao						
	end
end

Quando(/^editar o valor de arquitetura$/) do
	within_frame("OperationalRiskManagementFrame") do
		has_selector?("div#ormTable")
  		@collums_old = find("div#ormTable > div > table > tbody > tr:nth-child(1)").all("td")
  		@collums_old[12].click
  		page.execute_script("$('div#ormTable > div > table > tbody > tr:nth-child(1)')[0].scrollIntoView(true);")
  		find("ul#orm-group-list > li:nth-child(#{rand(2..4)}).noselect").click
  		@collums = find("div#ormTable > div > table > tbody > tr:nth-child(1)").all("td").collect(&:text)  		
  	end
end

Quando(/^editar o valor de execução$/) do
	within_frame("OperationalRiskManagementFrame") do
		has_selector?("div#ormTable")
  		@collums_old = find("div#ormTable > div > table > tbody > tr:nth-child(1)").all("td")
  		@collums_old[11].click
  		page.execute_script("$('div#ormTable > div > table > tbody > tr:nth-child(1)')[0].scrollIntoView(true);")
  		find("ul#orm-group-list > li:nth-child(#{rand(2..4)}).noselect").click
  		@collums = find("div#ormTable > div > table > tbody > tr:nth-child(1)").all("td").collect(&:text)
   	end
end

Quando(/^editar o valor de gerenciamento$/) do
	within_frame("OperationalRiskManagementFrame") do
		has_selector?("div#ormTable")
  		@collums_old = find("div#ormTable > div > table > tbody > tr:nth-child(1)").all("td")
  		@collums_old[13].click
  		page.execute_script("$('div#ormTable > div > table > tbody > tr:nth-child(1)')[0].scrollIntoView(true);")
  		find("ul#orm-group-list > li:nth-child(#{rand(2..4)}).noselect").click
  		@collums = find("div#ormTable > div > table > tbody > tr:nth-child(1)").all("td").collect(&:text)
   	end
end

Então(/^deverá realizar a alteração corretamente$/) do
	within_frame("OperationalRiskManagementFrame") do
		click_button("Save")
  		find("a.linkbutton.confirm").click
  		editar_última_versao
  		clicar_no_apply
  		has_selector?("div#ormTable")
  		@collums_actual = find("div#ormTable > div > table > tbody > tr:nth-child(1)").all("td")
		  expect(@collums[11]).to eq @collums_actual[11].text
  		expect(@collums[12]).to eq @collums_actual[12].text
  		expect(@collums[13]).to eq @collums_actual[13].text
  	end
end