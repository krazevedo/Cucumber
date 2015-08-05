#language: pt

Funcionalidade: Smoke Test Painel BRA

Cenario: Validar todas as páginas

	Dado que eu acesse o painel brasil
	Quando eu informar no campo "uEmail" com ""
	E eu informar no campo "uPassword" com ""
	E clicar no botão "okButton"
	Então deveria visualizar "MEU PAINEL" em Home do painel
	# E capturar screenshot
	Quando eu acessar a página de meus dados
	Então deveria vizualizar "SEUS DADOS" na página
	# E capturar screenshot
	Quando eu acessar a página de personalização
	Então deveria vizualizar "MINHA FOTO" na página
	# E capturar screenshot
	Quando eu acessar a página de visitas
	Então deveria vizualizar "VISITAS" na página
	# E capturar screenshot
	Quando eu acessar a página de clientes
	Então deveria vizualizar "CARTEIRA DE CLIENTES" na página
	# E capturar screenshot
	Quando eu selecionar um "perfil-do-cliente" no grid
	Então deveria vizualizar "PERFIL DO CLIENTE" na página
	# E capturar screenshot
	Quando eu acessar a página de pedidos
	Então deveria vizualizar "Pedidos aprovados" na página
	# E capturar screenshot
	# Quando eu selecionar o "start-date" no datapicker
	# #E eu selecionar o mês "Junho 2015" no datapicker
	# E eu selecionar o dia "9" no datapicker
	# E eu clicar no botão "btn-ok-datepicker" no datapicker
	# E eu selecionar um "detalhes-do-pedido" no grid
	# Então deveria vizualizar "Status do pedido:" na página
	# E capturar screenshot
	Quando eu acessar a página de cupons
	Então deveria vizualizar "CUPOM DE DESCONTO" na página
	# E capturar screenshot
	Quando eu acessar a página de sacolas abandonadas
	Então deveria vizualizar "SACOLAS ABANDONADAS" na página
	# E capturar screenshot
	Quando eu acessar a página de ofereça também
	Então deveria vizualizar "As dicas abaixo" na página
	# E capturar screenshot
	Quando eu acessar a página de ofereça de novo
	Então deveria vizualizar "Pelos nossos cálculos" na página
	# E capturar screenshot
	Quando eu acessar a página de aniversariantes
	Então deveria vizualizar "Entre em contato" na página
	# E capturar screenshot
	Quando eu acessar a página de aprenda mais vídeos
	Então deveria vizualizar "VÍDEO EM DESTAQUE" na página
	# E capturar screenshot
	Quando eu acessar a página de aprenda mais artigos
	Então deveria vizualizar "DICAS PARA CNDS" na página
	# E capturar screenshot
	Quando eu acessar a página de campanhas
	Então deveria vizualizar "CAMPANHAS" no iframe
	# E capturar screenshot
	Quando eu acessar a página de material de apoio
	Então deveria vizualizar "ADQUIRA MATERIAL DE APOIO" na página
	# E capturar screenshot
	Quando eu acessar a página de conteúdo digital
	Então deveria vizualizar "CONTEÚDO DIGITAL GRATUITO" na página
	# E capturar screenshot
	Quando eu acessar a página de fanpage
	Então deveria vizualizar "MINHA FANPAGE" na página
	# E capturar screenshot
	Quando eu acessar a página de fale com a gente
	Então deveria vizualizar "Atendimento via chat" na página
	# E capturar screenshot
	Quando eu acessar a página de faq
	Então deveria vizualizar "PERGUNTAS E RESPOSTAS" na página
	# E capturar screenshot