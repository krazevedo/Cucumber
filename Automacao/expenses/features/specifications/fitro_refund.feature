#language: pt

Funcionalidade: Filtrar Refund 

Cenario: Validar filtro de refund por data

	Dado que eu entre no expenses
	E filtrar um refund por data
	Então resultado por "data" deverá ser apresentado com sucesso

Cenario: Validar filtro de refund por tipo

	Dado que eu esteja no expenses
	E filtrar um refund por tipo
	Então resultado por "tipo" deverá ser apresentado com sucesso

Cenario: Validar filtro de refund por moeda

	Dado que eu esteja no expenses
	E filtrar um refund por moeda
	Então resultado por "moeda" deverá ser apresentado com sucesso