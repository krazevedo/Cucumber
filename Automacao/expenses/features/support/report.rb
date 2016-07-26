module Report

	def selecionar_opcao_combobox(field, value)
		find_by_id("#{field}_chosen").click
  		find_by_id("#{field}_chosen").first("li", :text => value).click
  	end

  	def fechar_modal
  		if has_selector?("div#warningDialog", :visible => true) then
  			click_button("btnOk")
  			sleep(1)
  		end
  	end  	

	def escolher_periodo(data_inicio, data_fim)
		fill_in("date_from", :with => data_inicio)
		fill_in("date_to", :with => data_fim)		
	end

	def gerar_relatorio
		click_button("GENERATE")
	end	

	def selecionar_dashboard(dashboard)
		find_by_id("ctl00_cphContent_selDashboard_chosen").click
		find("div#ctl00_cphContent_selDashboard_chosen > div > ul > li", :text => dashboard).click
	end

	def selecionar_report(report)
		sleep(1)
		find_by_id("ctl00_cphContent_selReport_chosen").click
		sleep(2)
		find("div#ctl00_cphContent_selReport_chosen > div > ul > li", :text => report, :match => :prefer_exact).click		         
	end

	def selecionar_card(report)
		has_selector?("div#cardsContainer > div > ul > li:nth-child(2)")
		first("div#cardsContainer > div > ul > li:nth-child(2)", :text => report).click
		wait_for_graph
	end

	def selecionar_groupby(group)
		selecionar_opcao_combobox("ctl00_cphContent_ddlGroupBy", group)
	end
	# #alterar dashboard
	# selecionar_opcao_combobox("ctl00_cphContent_selDashboard", "Sprint")
	# #alterar report
	# selecionar_opcao_combobox("ctl00_cphContent_selReport", "Sprint")
	# #alterar group by
	# selecionar_opcao_combobox("ctl00_cphContent_ddlGroupBy", "Sprint")
	# #alterar more filters
	# selecionar_opcao_combobox("selMoreFilters", "Sprint")
	# #alterar development phase
	# selecionar_opcao_combobox("DevelopmentPhase", "UAT")
	# #alterar development phase
	# selecionar_opcao_combobox("ctl00_cphContent_selDrillColumns", "Project")
	# #fechar modal alerta
	# click_button("btnOk")	
end

World(Report)