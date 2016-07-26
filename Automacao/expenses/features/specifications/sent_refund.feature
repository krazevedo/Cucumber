#language: pt

Funcionalidade: Enviar Refund 

Cenario: Validar envio do refund

	Dado que eu entre no expenses
	E seleciono e envio um refund
	Então voucher deve ser criado corretamente e refund deve aparecer na página de Pending	