#language: pt

Funcionalidade: Login no Painel BRA

Cenario: Validar login valido

	Dado que eu acesse o painel brasil em hml
	Quando eu informar no campo "uEmail" com ""
	E eu informar no campo "uPassword" com ""
	E clicar no botão "okButton"
	Então deveria visualizar "MEU PAINEL" em Home do painel
	E capturar screenshot

Cenario: Validar login invalido

	Dado que eu acesse o painel brasil em hml
	Quando eu informar no campo "uEmail" com ""
	E eu informar no campo "uPassword" com ""
	E clicar no botão "okButton"
	Então deveria visualizar mensagem de erro "Login ou senha inválidos."

Cenario: Validar senha invalida

	Dado que eu acesse o painel brasil em hml
	Quando eu informar no campo "uEmail" com ""
	E eu informar no campo "uPassword" com ""
	E clicar no botão "okButton"
	Então deveria visualizar mensagem de erro "Login ou senha inválidos."