#language: pt

Funcionalidade: ORM

Cenario: Validar valores ORM

	Dado que eu acesse o goal
	Quando eu acessar "orm"
	E acessar última versão
	Então deverá carregar corretamente as informações
	| SSO | Tower | Contract | Flow | Manager | Operation Risk | PML | NQC (L3M) | Architecture| Execution | Management | Performance | Client Satisfaction | KPs & Team | Sr Mgmt | Flow Type |
	| LATAM | UMKT_Payments | Alelo | Projeto Olimpíadas | kpassos | challenge & progress | 1.38 | | R | R | R | R | Y | Y | kpassos | Scrum |

Cenario: Obter metas do PML

	Dado que eu acesse o goal
	Quando eu acessar "pml admin"
	E acessar uma versão
	Então deverá obter metas

Cenario: Obter perguntas por grupos

	Dado que eu acesse o goal
	Quando eu acessar "pml"
	E acessar uma versão para "CI&T" e "Goal - Projeto"
	Então calcular nivel
	
Cenario: Comparar com ORM

	Dado que eu acesse o goal
	Quando eu acessar "orm"
	E acessar última versão
	E selecionar SSO "- ALL -" e Tower ""
	Então deverá comparar corretamente as informações da "Goal - Projeto"

Cenario: Editar ORM

	Dado que eu acesse o goal
	Quando eu acessar "orm"
	E editar última versão
	E selecionar SSO "- ALL -" e Tower "- ALL -"
	E editar o valor de arquitetura
	E editar o valor de execução
	E editar o valor de gerenciamento
	Então deverá realizar a alteração corretamente