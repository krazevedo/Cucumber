#language: pt

Funcionalidade: Cadastro Refund 

Cenario: Validar obrigatoriedade da imagem

	Dado que eu entre no expenses
	E cadastrar um refund sem imagem obrigatória
	Então mensagem deverá ser apresentada com sucesso	

Cenario: Validar obrigatoriedade de imagem e comentário

	Dado que eu esteja no expenses
	E cadastrar um refund sem imagem e comentário obrigatórios
	Então mensagem deverá ser apresentada com sucesso	

Cenario: Validar obrigatoriedade de comentário

	Dado que eu esteja no expenses
	E cadastrar um refund sem comentário obrigatório	
	Então mensagem deverá ser apresentada com sucesso	

Cenario: Validar obrigatoriedade de pessoas

	Dado que eu esteja no expenses
	E cadastrar um refund sem pessoas obrigatório	
	Então mensagem deverá ser apresentada com sucesso		