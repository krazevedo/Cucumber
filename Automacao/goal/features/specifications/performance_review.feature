#language: pt

Funcionalidade: Performance Review

Cenario: Validar valores métricas

	Dado que eu acesse o goal
	Quando eu acessar "performance review"
	E escolher radio do cliente "CI&T" e projeto "GOAL"
	Então deverá comparar valores das métricas
	| Cycle | Productivity Burn	| Productivity Build | Productivity All Work | Quality Dev | Quality UAT | Quality PROD	| Rework |
	| Sprint 19 - SmartCanvas | 26.525 hours/CP | 36.6 hours/CP | 36.6 hours/CP | 3.5 bugs/CP | 0.1 bugs/CP | 0.2 bugs/CP | 36.381 %|

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
	