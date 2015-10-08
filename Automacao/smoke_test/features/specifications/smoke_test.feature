#language: pt

Funcionalidade: Smoke Test Painel BRA

Cenario: Validar todas as páginas com table

	Dado que eu acesse o painel
	Quando eu informar no campo "uEmail" com "moginatura@gmail.com"
	E eu informar no campo "uPassword" com "1a2a3a"
	E clicar no botão "okButton"
	Então deveria visualizar "MEU PAINEL" na Home e capturar screenshot
	E ao acessar a página deveria visualizar o label e capturar screenshot
    | page | result | 
    | meus dados | SEUS DADOS |
    | personalização | MINHA FOTO |
    | visitas | VISITAS |
    | clientes | CARTEIRA DE CLIENTES |
    | perfil-do-cliente | PERFIL DO CLIENTE |
    | pedidos | Pedidos aprovados |
    | detalhes-do-pedido | Status do pedido: |
    | cupons | CUPOM DE DESCONTO |
    | sacolas abandonadas | SACOLAS ABANDONADAS |
    | ofereça também | As dicas abaixo |
    | ofereça de novo | Pelos nossos cálculos |
    | aniversariantes | Entre em contato |
    | aprenda mais vídeos | VÍDEO EM DESTAQUE |
    | aprenda mais artigos | DICAS PARA CNDS |
    | campanhas | CAMPANHAS ATIVAS |
    | material de apoio | ADQUIRA MATERIAL DE APOIO |
    | fanpage | MINHA FANPAGE |
    | fale com a gente | Atendimento via chat |
    | faq | PERGUNTAS E RESPOSTAS |
    