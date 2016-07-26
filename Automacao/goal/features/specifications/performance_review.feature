#language: pt

Funcionalidade: Performance Review

Cenario: Validar valores métricas

	Dado que eu acesse o goal
	Quando eu acessar "performance review"
	E escolher radio do cliente "CI&T" e projeto "GOAL"
	Então deverá comparar valores das métricas
	| Cycle | Productivity Burn	| Productivity Build | Productivity All Work | Quality Dev | Quality UAT | Quality PROD	| Rework |
	| Sprint 19 - SmartCanvas | 5.005 hours/CP | 6.906 hours/CP | 6.906 hours/CP | 0.66 bugs/CP | 0.1 bugs/CP | 0.003 bugs/CP | 36.381 %|

Cenario: Validar Endorse métricas

	Dado que eu acesse o goal
	Quando eu acessar "performance review"
	E escolher radio do cliente "CI&T" e projeto "GOAL"
	Então as métricas deverão estar endorse

Cenario: Validar Endorse métricas

	Dado que eu acesse o goal
	Quando eu acessar "performance review"
	E escolher radio do cliente "CI&T" e projeto "GOAL - Teste"
	Então as métricas deverão estar disagree
	