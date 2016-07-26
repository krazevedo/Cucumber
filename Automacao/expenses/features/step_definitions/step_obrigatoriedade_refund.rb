#encoding: utf-8 
#!/usr/bin/env ruby

Dado(/^cadastrar um refund sem imagem obrigatória$/) do
  	@type = 'Books'
	@city = 'Campinas'
	@value = '120'
	@comment = ''
	@tag = '#teste'
	@people = ''
	@image = false
	wait_for_allow
  	clicar_add
  	preencher_campos(@type, @city, @value, @comment, @tag, @people, @image)
end

Dado(/^cadastrar um refund sem imagem e comentário obrigatórios$/) do
  	@type = 'Taxi'
	@city = 'Belo Horizonte'
	@value = '100'
	@comment = ''
	@tag = '#teste'
	@people = ''
	@image = false
	wait_for_allow
  	clicar_add
  	preencher_campos(@type, @city, @value, @comment, @tag, @people, @image)
end

Dado(/^cadastrar um refund sem comentário obrigatório$/) do
  	@type = 'Mileage Reimbursement'
	@city = 'São Paulo'
	@value = '100'
	@comment = ''
	@tag = '#teste'
	@people = ''
	@image = false
	wait_for_allow
  	clicar_add
  	preencher_campos(@type, @city, @value, @comment, @tag, @people, @image)
end

Dado(/^cadastrar um refund sem pessoas obrigatório$/) do
  	@type = 'Meal (Team - In Site)'
	@city = 'Rio de Janeiro'
	@value = '100'
	@comment = 'Teste'
	@tag = '#teste'
	@people = ''
	@image = true
	wait_for_allow
  	clicar_add
  	preencher_campos(@type, @city, @value, @comment, @tag, @people, @image)
end

Então(/^mensagem deverá ser apresentada com sucesso$/) do
  validar_mensagens(@type)
end
