#language: pt

Funcionalidade: Cadastro de FAQ

Cenario: Validar cadastro de faq genérico

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "naturamasteruser"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "faq"
	E informar no campo "edit-title" com "Automação Teste Generic"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Generic"
	E selecionar a categoria "Informações básicas" no combobox
	E informar no conteúdo "Automação Teste Generic"
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso

Cenario: Validar cadastro de faq silver

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "naturamasteruser"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "faq"
	E informar no campo "edit-title" com "Automação Teste Silver"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Silver"
	E selecionar a categoria "Gerenciando seu espaço" no combobox
	E informar no conteúdo "Automação Teste Silver"
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso

Cenario: Validar cadastro de faq gold

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "naturamasteruser"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "faq"
	E informar no campo "edit-title" com "Automação Teste Gold"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Gold"
	E selecionar a categoria "Consultoria presencial" no combobox
	E informar no conteúdo "Automação Teste Gold"
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso

Cenario: Validar cadastro de faq platinum

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "naturamasteruser"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "faq"
	E informar no campo "edit-title" com "Automação Teste Platinum"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Platinum"
	E selecionar a categoria "Meus lucros" no combobox
	E informar no conteúdo "Automação Teste Platinum"
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso