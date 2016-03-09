#encoding: utf-8 
#!/usr/bin/env ruby

Quando(/^acessar uma versão$/) do 
	within_frame("pmlAdminFrame") do
		selecionar_versão_ativa				
	end
end

Quando(/^deverá obter perguntas "([^"]*)"$/) do |type| 
	within_frame("pmlAdminFrame") do
		obter_perguntas_pml_admin(type)
	end
end

Quando(/^acessar uma nova versão "([^"]*)" em "([^"]*)"$/) do |type, language|
	selecionar_customer_e_flow("CI&T", type)
	within_frame("PML_EValuationFrame") do
		verificar_new_evaluation_ou_not_submitted(type, language)	
		obter_perguntas_pml_evaluation()		
	end
end

Quando(/^acessar uma nova versão$/) do 
	selecionar_customer_e_flow("CI&T", "Goal - Projeto")
	within_frame("PML_EValuationFrame") do
		verificar_new_evaluation_ou_not_submitted("", "Portuguese")					
	end
end

Quando(/^acessar uma versão para "([^"]*)" e "([^"]*)"$/) do |customer, flow|
	selecionar_customer_e_flow(customer, flow)
	within_frame("PML_EValuationFrame") do
		verificar_new_evaluation_ou_not_submitted("", "Portuguese")					
	end
end

Quando(/^deverá ser equivalente a Nova Versão do PML em português$/) do
	comparar_perguntas_pt()
end

Quando(/^deverá ser equivalente a Nova Versão do PML em inglês$/) do
	comparar_perguntas_en()
end

Quando(/^deverá obter metas$/) do
	$metas = Array.new
	within_frame("pmlAdminFrame") do
		$metas = all("body > div.container.body-content > table:nth-child(7) > tbody > tr > td").collect(&:text)
		$meta_1 = ($metas[0].to_f / 100).round(2)
		$meta_2 = ($metas[1].to_f / 100).round(2)
		$meta_3 = ($metas[2].to_f / 100).round(2)
		$meta_4 = ($metas[3].to_f / 100).round(2)				
	end
end
