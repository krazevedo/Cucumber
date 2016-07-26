#language: pt

Funcionalidade: Cadastro Refund 

# Cenario: Validar cadastro de Refund com imagem obrigatória

# 	Dado que eu entre no expenses
# 	E cadastrar um refund com imagem obrigatória
# 	Então refund deverá ser criado com sucesso	

# Cenario: Validar cadastro de Refund com imagem e comentário obrigatórios

# 	Dado que eu esteja no expenses
# 	E cadastrar um refund com imagem e comentário obrigatórios
# 	Então refund deverá ser criado com sucesso	

# Cenario: Validar cadastro de Refund com comentário obrigatório

# 	Dado que eu esteja no expenses
# 	E cadastrar um refund com comentário obrigatório	
# 	Então refund deverá ser criado com sucesso

# Cenario: Validar cadastro de Refund com pessoas obrigatório

# 	Dado que eu esteja no expenses
# 	E cadastrar um refund com pessoas obrigatório	
# 	Então refund deverá ser criado com sucesso	

Cenario: Cadastrar todos os tipos

	Dado que eu entre no expenses
	E cadastrar refunds de todos os tipos