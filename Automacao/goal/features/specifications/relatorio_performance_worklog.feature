#language: pt

Funcionalidade: Relatório  

Cenario: Validar relatório Performance Worklog por Sprint

	Dado que eu acesse o goal
	Quando eu acessar "all reports"
	E escolher o cliente "CI&T" e projeto "GOAL"
	E selecionar o dashboard "Worklog" com relatório "Performance Worklog" agrupado por "Sprint"
	Então deverá estar equivalente os valores do Gráfico e da Drill	

Cenario: Validar relatório Performance Worklog por Mês

	Dado que eu acesse o goal
	Quando eu acessar "all reports"
	E escolher o cliente "CI&T" e projeto "GOAL"
	E selecionar o dashboard "Worklog" com relatório "Performance Worklog" agrupado por "Month"
	Então deverá estar equivalente os valores do Gráfico e da Drill	