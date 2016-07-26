#language: pt

Funcionalidade: Cadastro de Comunicados

Cenario: Validar cadastro de comunicados genérico

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "naturamasteruser"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "comunicados"
	E informar no campo "edit-title" com "Automação Teste Generic"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Generic"
	E selecionar a categoria "Sistema" no combobox
	E informar no campo "edit-field-com-link-und-0-value" com "http://rede.natura.net"
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso

Cenario: Validar cadastro de comunicados silver sem link

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "naturamasteruser"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "comunicados"
	E informar no campo "edit-title" com "Automação Teste Silver"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Silver"
	E selecionar a categoria "Premiações" no combobox
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso

Cenario: Validar cadastro de comunicados gold

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "naturamasteruser"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "comunicados"
	E informar no campo "edit-title" com "Automação Teste Gold"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Gold"
	E selecionar a categoria "Cliente" no combobox
	E informar no campo "edit-field-com-link-und-0-value" com "http://rede.natura.net"
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso

Cenario: Validar cadastro de comunicados platinum sem link

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "naturamasteruser"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "comunicados"
	E informar no campo "edit-title" com "Automação Teste Platinum"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Platinum"
	E selecionar a categoria "Dicas" no combobox
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso