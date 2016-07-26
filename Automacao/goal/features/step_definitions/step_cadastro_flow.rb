#encoding: utf-8 
#!/usr/bin/env ruby

Quando(/^cadastrar um flow$/) do
	find("button[class^='multiselect']").click
	choose("CI&T")
	within_frame("flowFrame") do
		click_link("New Flow")
		@name = Faker::StarWars.character
		fill_in("Name", :with => "Automação Teste - " + @name)
		select("Scrum", :from => "TypeId")
		fill_in("StartDate", :with => Time.now.strftime("%m/%d/%Y"))
  		fill_in("InceptionTime", :with => "5")  		
  		fill_in("SetupTime", :with => "5")
  		select("GOAL", :from => "bootstrap-duallistbox-nonselected-list_SelectedProjects")
  		click_button("Move selected")
		click_button("Save")
		find("a.linkbutton.confirm").click		
	end
end

Então(/^flow deverá ser criado com sucesso$/) do
	within_frame("flowFrame") do
		expect(find("table > tbody > tr > td:nth-child(1)", :text => @name))
	end
end