#encoding: utf-8 
#!/usr/bin/env ruby

Quando(/^escolher radio do cliente "([^"]*)" e projeto "([^"]*)"$/) do |customer, project|
	selecionar_customer_e_project_radio(customer, project)	
end

Então(/^deverá comparar valores das métricas$/) do |table|
	within_frame("PerformanceReviewFrame") do
		data =  retorna_tabela_hash(table)
		count = data['Cycle'].size.to_i
  		count.times do | vnum |
		metrics, grid = Array.new(), Array.new()		
		while has_text?(data['Cycle'][vnum].to_s) != true
			find('a', :text => 'NEXT PAGE').click			
		end
		grid = find("div.metrics-card-header", :text => data['Cycle'][vnum].to_s).find(:xpath, '..').all("table > tbody > tr")
		metrics = grid.collect {|x| x.find("td:nth-child(2) > span").text}			  	
  			expect(metrics[0]).to eq data['Productivity Burn'][vnum].to_s
			expect(metrics[1]).to eq data['Productivity Build'][vnum].to_s
			expect(metrics[2]).to eq data['Productivity All Work'][vnum].to_s
			expect(metrics[3]).to eq data['Quality Dev'][vnum].to_s
			expect(metrics[4]).to eq data['Quality UAT'][vnum].to_s
			expect(metrics[5]).to eq data['Quality PROD'][vnum].to_s						
			expect(metrics[6]).to eq data['Rework'][vnum].to_s	
		end  		
  	end
end

Então(/^as métricas deverão estar endorse$/) do
	within_frame("PerformanceReviewFrame") do
	 	metrics, grid = Array.new(), Array.new()
	 	while has_text?("Release Sprint - PML") != true
			find('a', :text => 'NEXT PAGE').click			
		end
		grid = find("div.metrics-card-header", :text => "Release Sprint - PML").find(:xpath, '..').all("table > tbody > tr")
		metrics = grid.collect {|x| x.find("td:nth-child(5) > span")[:class].include?"endorsed"}	
		metrics.each {|x| expect(x).to eq true}
	end
end

Então(/^as métricas deverão estar disagree$/) do
	within_frame("PerformanceReviewFrame") do
	 	metrics, grid = Array.new(), Array.new()
	 	while has_text?("Sprint 17") != true
			find('a', :text => 'NEXT PAGE').click			
		end
		grid = find("div.metrics-card-header", :text => "Sprint 17").find(:xpath, '..').all("table > tbody > tr")
		metrics = grid.collect {|x| x.find("td:nth-child(5) > span")[:class].include?"disagree"}	
		metrics.each {|x| expect(x).to eq true}
	end
end
