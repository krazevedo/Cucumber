#encoding: utf-8 
#!/usr/bin/env ruby

Então(/^deverá obter os PMLs$/) do |table|
   data =  retorna_tabela_hash(table)
   count = data['sso'].size.to_i
   count.times do | vnum |
	   within_frame("pmlReportFrame") do
         select(data['sso'][vnum].to_s, :from =>"SSO")
         selecionar_opcao_combobox("tower", data['tower'][vnum].to_s)
         selecionar_opcao_combobox("contract", data['contract'][vnum].to_s)
         select(data['year'][vnum].to_s, :from => "Year")
         select(data['quarter'][vnum].to_s, :from =>"Quarter")
         select(data['month'][vnum].to_s, :from =>"Month")
         select(data['model'][vnum].to_s, :from =>"Process Model")
         clicar_no_generate_report
         validar_quantidade_raw(data, vnum)
         page.driver.browser.navigate.refresh	
      end
 	end    
end