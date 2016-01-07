#language: pt

Funcionalidade: Relatório  

Cenario: Validar relatório Quality DEV por Sprint

	Dado que eu acesse o goal
	Quando eu acessar "all reports"
	E escolher o cliente "CI&T" e projeto "GOAL"
	E selecionar o dashboard "KPIs and SLAs" com relatório "Quality (DEV Bugs/ CP)" agrupado por "Sprint"
	Então deverá estar equivalente os valores do Gráfico e da Drill

Cenario: Validar relatório Quality DEV por Mês

	Dado que eu acesse o goal
	Quando eu acessar "all reports"
	E escolher o cliente "CI&T" e projeto "GOAL"
	E selecionar o dashboard "KPIs and SLAs" com relatório "Quality (DEV Bugs/ CP)" agrupado por "Month"
	Então deverá estar equivalente os valores do Gráfico e da Drill

# Cenario: Validar Metrics Status Not Applicable

# 	Dado que eu acesse o goal
# 	Quando eu acessar "all reports"
# 	E escolher o cliente "CI&T" e projeto "GOAL"
# 	E selecionar o dashboard "KPIs and SLAs" com relatório "Quality (DEV Bugs/ CP)" agrupado por "Month" no periodo de "07/01/2015" a "07/31/2015"
# 	Então deverá estar "inativo" o botão para o Performance Review

# Cenario: Validar Metrics Status Disagree

# 	Dado que eu acesse o goal
# 	Quando eu acessar "all reports"
# 	E escolher o cliente "CI&T" e projeto "GOAL"
# 	E selecionar o dashboard "KPIs and SLAs" com relatório "Quality (DEV Bugs/ CP)" agrupado por "Month" no periodo de "03/01/2015" a "03/31/2015"
# 	Então deverá estar "disagree" o botão para o Performance Review

# Cenario: Validar Metrics Status Endorse

# 	Dado que eu acesse o goal
# 	Quando eu acessar "all reports"
# 	E escolher o cliente "CI&T" e projeto "GOAL"
# 	E selecionar o dashboard "KPIs and SLAs" com relatório "Quality (DEV Bugs/ CP)" agrupado por "Month" no periodo de "04/01/2015" a "04/30/2015"
# 	Então deverá estar "endorsed" o botão para o Performance Review

# Cenario: Validar Metrics Status Pending

# 	Dado que eu acesse o goal
# 	Quando eu acessar "all reports"
# 	E escolher o cliente "CI&T" e projeto "GOAL"
# 	E selecionar o dashboard "KPIs and SLAs" com relatório "Quality (DEV Bugs/ CP)" agrupado por "Sprint" no periodo de "04/01/2015" a "04/30/2015"
# 	Então deverá estar "ativo" o botão para o Performance Review

#  Cenario: Validar Redirecionamento para Performance Review

# 	Dado que eu acesse o goal
# 	Quando eu acessar "all reports"
# 	E escolher o cliente "CI&T" e projeto "GOAL"
# 	E selecionar o dashboard "KPIs and SLAs" com relatório "Quality (DEV Bugs/ CP)" agrupado por "Sprint" no periodo de "04/01/2015" a "04/30/2015"
# 	E clicar no botão do Performance Review
# 	Então deverá redirecionar para a página Performance Review