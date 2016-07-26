#encoding: utf-8 
#!/usr/bin/env ruby

Quando(/^escolher o cliente "([^"]*)" e projeto "([^"]*)"$/) do |customer, project|
	selecionar_customer_e_project(customer, project)	
end

Quando(/^visualizar o card "([^"]*)" com relatório "([^"]*)"$/) do |card, report|
	find_by_id("cardsContainer").find("h1", :text => card).find(:xpath, '..').find("li:nth-child(2)").click
	selecionar_relatorio(report)
	escolher_periodo("07/01/2015", "10/01/2015")
	gerar_relatorio
	wait_for_graph
	calcula_quantidade_de_itens(report)
	obter_valores_drill(report)
	obter_valores_grafico(report)
end

Quando(/^selecionar o dashboard "([^"]*)" com relatório "([^"]*)" agrupado por "([^"]*)"$/) do |dashboard, report, group|
	selecionar_dashboard(dashboard)
	selecionar_report(report)
	escolher_periodo("07/01/2015", "10/01/2015")
	selecionar_groupby(group)
	gerar_relatorio
	wait_for_graph
	calcula_quantidade_de_itens(report)
	obter_valores_drill(report)
	obter_valores_grafico(report)
end

Quando(/^selecionar o dashboard "([^"]*)" com relatório "([^"]*)" agrupado por "([^"]*)" no periodo de "([^"]*)" a "([^"]*)"$/) do |dashboard, report, group, initial_date, end_date|
	selecionar_dashboard(dashboard)
	selecionar_report(report)
	escolher_periodo(initial_date, end_date)
	selecionar_groupby(group)
	gerar_relatorio
	wait_for_graph	
end

Quando(/^selecionar o dashboard "([^"]*)" com relatório "([^"]*)"$/) do |dashboard, report|
	selecionar_dashboard(dashboard)
	selecionar_report(report)
	gerar_relatorio
	wait_for_graph
	calcula_quantidade_de_itens(report)
	obter_valores_drill(report)
	obter_valores_grafico(report)
end

Quando(/^deverá estar equivalente os valores do Gráfico e da Drill$/) do 
	fechar_modal
	comparar_grafico_e_drill
end

Quando(/^deverá estar "([^"]*)" o botão para o Performance Review$/) do |status|
	verificar_metrics_status(status)	
end

Quando(/^clicar no botão do Performance Review$/) do
	clicar_no_botao_status
end

Quando(/^deverá redirecionar para a página Performance Review$/) do
	verificar_redirect_performance_review	
end

Quando(/^deverá publicar no Smart Canvas$/) do
	publicar_smart_canvas	
end

Quando(/^selecionar o card "([^"]*)"$/) do |report|
	selecionar_card(report)
end

Quando(/^acessar os relatórios do card$/) do
	selecionar_customer_e_project("CI&T", "GOAL")
	has_selector?("div#cardsContainer > div")
	cards = all("div#cardsContainer > div").count
	for i in 1..cards
		report = find("div#cardsContainer > div:nth-child(#{i}) > h1").text
		binding.pry
		page.execute_script("$('div#cardsContainer > div:nth-child(#{i}) > ul > li:nth-child(2)')[0].scrollIntoView(true);")
		find("div#cardsContainer > div:nth-child(#{i}) > ul > li:nth-child(2)").click  
		wait_for_graph
		expect(find("span#subtitleChart")).to have_text(:all, report)  
		Capybara::Screenshot.screenshot_and_save_page
		find("a#btnbacktocards").click  
	end 
end

Quando(/^acessar todos os relatórios$/) do
	selecionar_customer_e_project("CI&T", "GOAL")
	find_by_id("ctl00_cphContent_selDashboard_chosen").click
	dashboards = all("div#ctl00_cphContent_selDashboard_chosen div ul li").count 
	for i in 1..dashboards
		if  i != 1
			then find_by_id("ctl00_cphContent_selDashboard_chosen").click
		end
		find("div#ctl00_cphContent_selDashboard_chosen div ul li:nth-child(#{i})").click
		sleep(2)
		find_by_id("ctl00_cphContent_selReport_chosen").click
		reports = all("div#ctl00_cphContent_selReport_chosen > div > ul > li").count
		for j in 1..reports
			if j != 1 
				then find_by_id("ctl00_cphContent_selReport_chosen").click
			end
			report = find("div#ctl00_cphContent_selReport_chosen > div > ul > li:nth-child(#{j})").text
			find("div#ctl00_cphContent_selReport_chosen > div > ul > li:nth-child(#{j})").click		
			click_button("GENERATE")
			page.execute_script('window.scrollTo(100000,0)')
			wait_for_graph
			have_content?("span#titleChart", :text => report)
			sleep(3)
			Capybara::Screenshot.screenshot_and_save_page						
		end
	end	
end