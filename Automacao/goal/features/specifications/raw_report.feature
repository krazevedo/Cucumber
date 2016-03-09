#language: pt

Funcionalidade: Raw Report

Cenario: Obter todos Flows de 2015

	Dado que eu acesse o goal
	Quando eu acessar "raw"
	Então deverá obter os Flows
	| ano | mês | scope | quarter | pml | tower | contract | model | closed | esperado |
	| - ALL - | - ALL - | - ALL - | - ALL - | - ALL - | - ALL - | - ALL - | - ALL - | - ALL - | 342 |
	| 2015 | - ALL - | - ALL - | - ALL - | - ALL - | - ALL - | - ALL - | - ALL - | - ALL - | 342 |
	| 2015 | January | Yes | - ALL - | - ALL - | - ALL - | - ALL - | - ALL - | - ALL - | 342 |
	| 2015 | January | Yes | Q1 | - ALL - | - ALL - | - ALL - | - ALL - | - ALL - | 342 |
	| 2015 | January | Yes | Q1 | 0 - Not Compliant | - ALL - | - ALL - | - ALL - | - ALL - | 41 |
	| 2015 | January | Yes | Q1 | 0 - Not Compliant | UMKT_Commerce | - ALL - | - ALL - | - ALL - | 5 |
	| 2015 | January | Yes | Q1 | 0 - Not Compliant | UMKT_Commerce | Netshoes | - ALL - | - ALL - | 2 |
	| 2015 | January | Yes | Q1 | 0 - Not Compliant | UMKT_Commerce | Netshoes | Scrum | - ALL - | 2 |
	| 2015 | January | Yes | Q1 | 0 - Not Compliant | UMKT_Commerce | Netshoes | Scrum | No | 2 |