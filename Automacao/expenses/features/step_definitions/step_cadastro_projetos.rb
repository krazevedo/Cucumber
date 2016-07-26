#encoding: utf-8 
#!/usr/bin/env ruby

Dado(/^que (?:|eu) acesse o (.+)$/) do |page_name|
  visit path_to(page_name)
  realizar_login
end

Quando(/^eu acessar (.+)$/) do |page_name|
	visit path_to(page_name)	
end

Quando(/^cadastrar um projeto$/) do
	find("button[class^='multiselect']").click
	choose("CI&T")
	within_frame("ProjectFrame") do
		click_link("New Project")
		@name = Faker::Lorem.characters(5)
		fill_in("Name", :with => "Automação Teste - " + @name)
		selecionar_opcao_combobox("IssueTrackerType", "External")
  		selecionar_opcao_combobox("Type", "Scrum")
  		select("Month", :from => "Timebox")
  		fill_in("TypeConfigurationStartDate", :with => Time.now.strftime("%m/%d/%Y"))
		click_button("Save")
		find("a.linkbutton.confirm").click		
	end
end

Então(/^projeto deverá ser criado com sucesso$/) do
	within_frame("ProjectFrame") do
		expect(find("table > tbody > tr > td:nth-child(2)", :text => @name))
	end
end
