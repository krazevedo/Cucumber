#language: pt

Funcionalidade: Meus dados pessoais

# Cenario: Validar atualização do Telefone
	
# 	Dado que eu acesse o painel
# 	Quando eu informar no campo "uEmail" com "moginatura@gmail.com"
# 	E eu informar no campo "uPassword" com "1a2a3a"
# 	E clicar no botão "okButton"
# 	Então deveria visualizar "MEU PAINEL" em Home do painel
# 	Quando eu acessar "meus dados"
# 	E atualizar o campo "phone"
# 	E clicar no botão "Salvar"
# 	Então deverá ser atualizado com sucesso

# Cenario: Validar serviço de CEP

# 	Dado que eu acesse o painel
# 	Quando eu informar no campo "uEmail" com "moginatura@gmail.com"
# 	E eu informar no campo "uPassword" com "1a2a3a"
# 	E clicar no botão "okButton"
# 	Então deveria visualizar "MEU PAINEL" em Home do painel
# 	Quando eu acessar "meus dados"
# 	E atualizar o campo "cep" com "13460000"
# 	Então "city" deverá ser atualizada com "NOVA ODESSA"

Cenario: Validar atualização do cartão de crédito

	Dado que eu acesse o painel
	Quando eu informar no campo "uEmail" com "moginatura@gmail.com"
	E eu informar no campo "uPassword" com "1a2a3a"
	E clicar no botão "okButton"
	Então deveria visualizar "MEU PAINEL" em Home do painel
	Quando eu acessar "meus dados"
	E clicar no link "#form-update-creditcard"
	E atualizar o campo "cardNumber"
	E atualizar o campo "cardName"
	E selecionar o mês "10" e o ano "2020"
	E clicar no botão "Salvar"
	Então deverá ser atualizado com sucesso
