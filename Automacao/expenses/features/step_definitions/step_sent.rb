#encoding: utf-8 
#!/usr/bin/env ruby

Quando(/^seleciono e envio um refund$/) do
	wait_for_allow
	selecionar_refund
	pegar_valores_grid_sent
	selecionar_budget("Budget_out_2016", "SulAmericaSP-ADS")
	pegar_valor_selecionado
	comparar_valores
	enviar_refund
end

Então(/^voucher deve ser criado corretamente e refund deve aparecer na página de Pending$/) do
	selecionar_aba("PENDING")  
	pegar_valores_grid_pending
	validar_refund_enviado
end
