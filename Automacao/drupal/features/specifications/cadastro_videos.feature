#language: pt

Funcionalidade: Cadastro de Vídeos

Cenario: Validar cadastro de vídeos genérico

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "naturamasteruser"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "videos"
	E informar no campo "edit-title" com "Automação Teste Generic"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Generic"
	E selecionar a categoria "A Rede Natura" no combobox
	E informar a imagem "SUZUKI_Swift_SHORTArticles_2013_FEB_natura_04.jpg"
	E informar no campo "edit-field-lmv-video-link-und-0-value" a URL do vídeo "https://vimeo.com/137880643"
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso
	
Cenario: Validar cadastro de vídeos gold

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "naturamasteruser"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "videos"
	E informar no campo "edit-title" com "Automação Teste Gold"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Gold"
	E selecionar a categoria "Produtos: conheça seu porfolio!" no combobox
	E informar a imagem "SUZUKI_Swift_SHORTArticles_2013_FEB_natura_04.jpg"
	E informar no campo "edit-field-lmv-video-link-und-0-value" a URL do vídeo "https://vimeo.com/137880643"
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso
	

Cenario: Validar cadastro de vídeos platinum

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "naturamasteruser"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "videos"
	E informar no campo "edit-title" com "Automação Teste Platinum"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Platinum"
	E selecionar a categoria "Mais dicas para trabalhar em favor do seu negócio." no combobox
	E informar a imagem "SUZUKI_Swift_SHORTArticles_2013_FEB_natura_04.jpg"
	E informar no campo "edit-field-lmv-video-link-und-0-value" a URL do vídeo "https://vimeo.com/137880643"
	E clicar no botão "Publicar"
	Então deverá ser criado com sucesso
	

Cenario: Validar cadastro de vídeos silver

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "naturamasteruser"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "videos"
	E informar no campo "edit-title" com "Automação Teste Silver"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Silver"
	E selecionar a categoria "Simplificando o Marketing Digital" no combobox
	E informar a imagem "SUZUKI_Swift_SHORTArticles_2013_FEB_natura_04.jpg"
	E informar no campo "edit-field-lmv-video-link-und-0-value" a URL do vídeo "https://vimeo.com/137880643"
	E clicar no botão "Publicar"	
	Então deverá ser criado com sucesso

Cenario: Validar cadastro de vídeos destaque

	Dado que eu acesse o painel drupal
	Quando eu informar no campo "edit-name" com "naturamasteruser"
	E eu informar no campo "edit-pass" com "S1t3Adm1n99;"
	E clicar no botão "edit-submit"
	Quando eu acessar "videos"
	E informar no campo "edit-title" com "Automação Teste Destaque"
	E selecionar o idioma "Português, Brasil"
	E selecionar o segmento "Silver"
	E selecionar a categoria "Simplificando o Marketing Digital" no combobox
	E informar a imagem "SUZUKI_Swift_SHORTArticles_2013_FEB_natura_04.jpg"
	E informar no campo "edit-field-lmv-video-link-und-0-value" a URL do vídeo "https://vimeo.com/137880643"
	E selecionar "Destaque"
	E clicar no botão "Publicar"	
	Então deverá ser criado com sucesso