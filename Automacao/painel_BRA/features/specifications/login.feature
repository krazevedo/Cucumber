#language: pt

Funcionalidade: Login no Painel BRA

Cenario: Validar login valido

	Dado que eu acesse o painel
	Quando eu informar no campo "uEmail" com "moginatura@gmail.com"
	E eu informar no campo "uPassword" com "1a2a3a"
	E clicar no botão "okButton"
	Então deveria visualizar "MEU PAINEL" em Home do painel
	E capturar screenshot

Cenario: Validar login e/ou senha invalidos

	Dado que eu acesse o painel
	Quando eu informar login e senha inválidos apresentará mensagem de erro
	| login | password| result |
	| mogi@gmail.com | 1a2a3a | Login ou senha inválidos. |
	| moginatura@gmail.com | 123456 | Login ou senha inválidos. |