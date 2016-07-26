#encoding: utf-8 
#!/usr/bin/env ruby

Dado(/^que (?:|eu) entre no (.+)$/) do |page_name|
  	visit path_to(page_name)
  	logar_no_google  	
end

Dado(/^que (?:|eu) esteja no (.+)$/) do |page_name|
  	visit path_to(page_name)  	 	
end

Quando(/^cadastrar um refund com imagem obrigatória$/) do
	@type = 'Books'
	@city = 'Campinas'
	@currency = 'Real'
	@value = Faker::Number.between(1, 1000)
	@comment = ''
	@tag = '#teste'
	@people = ''
	@image = true
	wait_for_allow
  	clicar_add
  	preencher_campos(@type, @city, @currency, @value, @comment, @tag, @people, @image)
end

Dado(/^cadastrar um refund com imagem e comentário obrigatórios$/) do
  	@type = 'Taxi'
	@city = 'Belo Horizonte'
	@currency = 'Dollar'
	@value = Faker::Number.between(1, 1000)
	@comment = 'Teste ' + Faker::StarWars.character
	@tag = '#teste'
	@people = ''
	@image = true
	wait_for_allow
  	clicar_add
  	preencher_campos(@type, @city, @currency, @value, @comment, @tag, @people, @image)
end

Dado(/^cadastrar um refund com comentário obrigatório$/) do
  	@type = 'Mileage Reimbursement'
	@city = 'São Paulo'
	@currency = 'Dollar'
	@value = Faker::Number.between(1, 1000)
	@comment = 'Teste ' + Faker::StarWars.character
	@tag = '#teste'
	@people = ''
	@image = false
	wait_for_allow
  	clicar_add
  	preencher_campos(@type, @city, @currency, @value, @comment, @tag, @people, @image)
end

Dado(/^cadastrar um refund com pessoas obrigatório$/) do
  	@type = 'Meal (Team - In Site)'
	@city = 'Rio de Janeiro'
	@currency = 'Real'
	@value = Faker::Number.between(1, 1000)
	@comment = 'Teste ' + Faker::StarWars.character
	@tag = '#teste'
	@people = 'kaior'
	@image = true
	wait_for_allow
  	clicar_add
  	preencher_campos(@type, @city, @currency, @value, @comment, @tag, @people, @image)
end

Então(/^refund deverá ser criado com sucesso$/) do
  validar_refund_criado(@type, @city, @value, @comment, @image)
end

Então(/^cadastrar refunds de todos os tipos$/) do
 	@city = 'Rio de Janeiro'
	@currency = 'Real'
	@tag = '#teste'
	@people = 'kaior'
	@image = true
	@types = 0
	@type = Array.new
	wait_for_allow
  	clicar_add
  	find('md-select', :text => 'Expense Type').click
  	@types = all('md-option > div.md-text.ng-binding').count
  	@type = all('md-option > div.md-text.ng-binding').collect(&:text)
  	first('md-option > div.md-text.ng-binding').click
  	click_button('Close')
  	for i in 0..@types-1 
  		@value = Faker::Number.between(1, 1000)
		@comment = Faker::StarWars.character + 'Teste'
  		wait_for_allow
  		clicar_add
  		preencher_campos(@type[i], @city, @currency, @value, @comment, @tag, @people, @image)
  		x = 0
		while has_css?('body#app > div#toast-container > div > div > div.toast-message') == false and x < 10
			sleep(0.1) 
			x += 1
		end
		sleep(1)
  	end
end
