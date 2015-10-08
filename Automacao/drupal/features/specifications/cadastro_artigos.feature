#language: pt

Funcionalidade: Cadastro de Artigos

Cenario: Validar cadastro de artigos genérico

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "admin"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "artigos"
	E informar no campo "edit-title" com "Automação Teste Generic"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Generic"
	E selecionar "Visitas"
	E informar no conteúdo "Automação Teste" 
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso

Cenario: Validar cadastro de artigos gold

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "admin"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "artigos"
	E informar no campo "edit-title" com "Automação Teste Gold"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Gold"
	E selecionar "Vendas"
	E informar no conteúdo "Automação Teste" 
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso

Cenario: Validar cadastro de artigos platinum

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "admin"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "artigos"
	E informar no campo "edit-title" com "Automação Teste Platinum"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Platinum"
	E selecionar "Lealdade"
	E informar no conteúdo "Automação Teste" 
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso

Cenario: Validar cadastro de artigos silver

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "admin"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "artigos"
	E informar no campo "edit-title" com "Automação Teste Silver"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Silver"
	E selecionar "Visitas"
	E informar no conteúdo "Automação Teste" 
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso

Cenario: Validar cadastro de artigos com imagem

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "admin"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "artigos"
	E informar no campo "edit-title" com "Automação Teste Imagem"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Generic"
	E selecionar "Visitas"
	E informar no conteúdo "Automação Teste" 
	E informar imagem no conteúdo "SUZUKI_Swift_SHORTArticles_2013_FEB_natura_04.jpg"
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso

Cenario: Validar cadastro de artigos com video

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "admin"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "artigos"
	E informar no campo "edit-title" com "Automação Teste Imagem"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Generic"
	E selecionar "Visitas"
	E informar no conteúdo "Automação Teste" 
	E informar video no conteúdo "https://vimeo.com/137880643"
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso