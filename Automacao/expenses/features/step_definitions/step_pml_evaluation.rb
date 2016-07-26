#encoding: utf-8 
#!/usr/bin/env ruby

Quando(/^responder atingindo o nivel "([^"]*)"$/) do |level| 
	responder_avaliacao(level)	
end

Então(/^deverá calcular e pintar o card corretamente$/) do
 	validar_porcentagem_nivel
 	validar_cor_nivel
end

Então(/^calcular nivel$/) do
	setar_variaveis
	within_frame("PML_EValuationFrame") do
		somar_respostas_por_grupo 
	end
	calcular_porcentagem
	comparar_com_metas
end