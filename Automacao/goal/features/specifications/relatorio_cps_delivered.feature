	#language: pt

Funcionalidade: Relatório  

Cenario: Validar relatório CP Delivered por Sprint

	Dado que eu acesse o goal
	Quando eu acessar "all reports"
	E escolher o cliente "CI&T" e projeto "GOAL"
	E selecionar o dashboard "Project" com relatório "Complexity Points Delivered" agrupado por "Sprint"
	Então deverá estar equivalente os valores do Gráfico e da Drill

Cenario: Validar relatório CP Delivered por Mês

	Dado que eu acesse o goal
	Quando eu acessar "all reports"
	E escolher o cliente "CI&T" e projeto "GOAL"
	E selecionar o dashboard "Project" com relatório "Complexity Points Delivered" agrupado por "Month"
	Então deverá estar equivalente os valores do Gráfico e da Drill

Cenario: Validar export Smart Canvas

	Dado que eu acesse o goal
	Quando eu acessar "all reports"
	E escolher o cliente "CI&T" e projeto "GOAL"
	E selecionar o dashboard "Project" com relatório "Complexity Points Delivered" agrupado por "Sprint"
	Então deverá publicar no Smart Canvas

Cenario: Validar card no Smart Canvas

	Dado que eu entre no smart canvas
	Quando eu acessar "pending"
	Então card deverá estar criado no Smart Canvas

Cenario: Validar export Smart Canvas Project Cards

	Dado que eu acesse o goal
	Quando eu acessar "card reports"
	E escolher o cliente "CI&T" e projeto "GOAL"
	E selecionar o card "Complexity Points Delivered"
	Então deverá publicar no Smart Canvas

Cenario: Validar card no Smart Canvas

	Dado que eu entre no smart canvas
	Quando eu acessar "pending"
	Então card deverá estar criado no Smart Canvas