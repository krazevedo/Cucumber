#language: pt

Funcionalidade: Relatório  

Cenario: Validar relatório Current Backlog

	Dado que eu acesse o goal
	Quando eu acessar "all reports"
	E escolher o cliente "CI&T" e projeto "GOAL"
	E selecionar o dashboard "Assignee" com relatório "Current Backlog"
	Então deverá estar equivalente os valores do Gráfico e da Drill

