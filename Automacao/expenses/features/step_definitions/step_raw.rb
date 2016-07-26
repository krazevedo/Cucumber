#encoding: utf-8 
#!/usr/bin/env ruby

Então(/^deverá obter os Flows$/) do |table|
   data =  retorna_tabela_hash(table)
   count = data['ano'].size.to_i
   count.times do | vnum |
	   within_frame("Raw_ReportFrame") do
         selecionar_opcao_combobox("ReportFilter_SelectedYear", data['ano'][vnum].to_s)
         selecionar_opcao_combobox("ReportFilter_SelectedMonth", data['mês'][vnum].to_s)
         selecionar_opcao_combobox("ReportFilter_SelectedScope", data['scope'][vnum].to_s)
         selecionar_opcao_combobox("ReportFilter_SelectedQuarter", data['quarter'][vnum].to_s)
         selecionar_opcao_combobox("ReportFilter_SelectedLevel", data['pml'][vnum].to_s)
         selecionar_opcao_combobox("ReportFilter_SelectedTower", data['tower'][vnum].to_s)
         selecionar_opcao_combobox("ReportFilter_SelectedCustomer", data['contract'][vnum].to_s)
         selecionar_opcao_combobox("ReportFilter_SelectedProcessModel", data['model'][vnum].to_s)
         page.execute_script("$('div#ReportFilter_SelectedActiveOrInactiveFlows_chosen')[0].scrollIntoView(true);")
         selecionar_opcao_combobox("ReportFilter_SelectedActiveOrInactiveFlows", data['closed'][vnum].to_s)
         clicar_no_apply
         validar_quantidade_raw(data, vnum)
         page.driver.browser.navigate.refresh	
      end
 	end    
end