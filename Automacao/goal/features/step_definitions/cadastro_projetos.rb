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
		fill_in("Name", :with => "Automação Teste")
  		fill_in("Key", :with => "Automação Teste")
  		selecionar_opcao_combobox("IssueTrackerType", "Jiracloud")
  		selecionar_opcao_combobox("selectedDoneStatus", "To Do")
  		selecionar_opcao_combobox("selectedBacklogTypes", "Bug")
  		selecionar_opcao_combobox("Type", "Scrum")
  		select("Month", :from => "Timebox")
		fill_in("TypeConfigurationStartDate", :with => "11/05/2015")
		fill_in("WorkHours", :with => "HH")
		select("São Paulo", :from => "cities")
		click_button("Save")		
	end
end