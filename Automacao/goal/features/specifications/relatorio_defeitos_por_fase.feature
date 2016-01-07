#language: pt

Funcionalidade: Relatório  

Cenario: Validar relatório Opened Bugs por Sprint

	Dado que eu acesse o goal
	Quando eu acessar "all reports"
	E escolher o cliente "CI&T" e projeto "GOAL"
	E selecionar o dashboard "Development Phase" com relatório "Opened Bugs" agrupado por "Sprint"
	Então deverá estar equivalente os valores do Gráfico e da Drill

Cenario: Validar relatório Opened Bugs por Mês

	Dado que eu acesse o goal
	Quando eu acessar "all reports"
	E escolher o cliente "CI&T" e projeto "GOAL"
	E selecionar o dashboard "Development Phase" com relatório "Opened Bugs" agrupado por "Month"
	Então deverá estar equivalente os valores do Gráfico e da Drill