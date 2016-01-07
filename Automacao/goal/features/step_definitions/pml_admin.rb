#encoding: utf-8 
#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "table"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "support"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "wait"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "graphic"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "report"))

Quando(/^acessar uma versão$/) do 
	within_frame("pmlAdminFrame") do
		grid_versions = all("table > tbody > tr")
		for i in 0..grid_versions.count
			new_version = grid_versions[i].all("td")
			if new_version[1].text != "" then
				$version = new_version[0].text
				new_version[3].first("a").click
				break
			end
		end						
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
	selecionar_customer_e_flow("CI&T", "")
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

Quando(/^responder atingindo o nivel "([^"]*)"$/) do |level| 
	responder_avaliacao(level)	
end

Então(/^deverá calcular e pintar o card corretamente$/) do
  validar_porcentagem_nivel
  validar_cor_nivel
end

