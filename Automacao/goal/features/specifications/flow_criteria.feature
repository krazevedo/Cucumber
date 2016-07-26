#language: pt

Funcionalidade: Flow Criteria

Cenario: Obter todos os últimos PMLs 
	Dado que eu acesse o goal
	Quando eu acessar "flow criteria"
	Então deverá obter os PMLs
	| sso | tower | contract | year | quarter | month | model | esperado |
	| LATAM | - ALL - | - ALL - | - ALL - | - ALL - | - ALL - | - ALL - | 2 |
	| LATAM | UMKT_Banks | - ALL - | - ALL - | - ALL - | - ALL - | - ALL - | 1 |
	| LATAM | UMKT_Banks | BV | - ALL - | - ALL - | - ALL - | - ALL - | 1 |
	| LATAM | UMKT_Banks | BV | 2016 | - ALL - | - ALL - | - ALL - | 1 |
	| LATAM | UMKT_Banks | BV | 2016 | Q1 | - ALL - | - ALL - | 1 |
	| LATAM | UMKT_Banks | BV | 2016 | Q1 | February | - ALL - | 1 |
	| LATAM | UMKT_Banks | BV | 2016 | Q1 | February | Scrum | 1 |	