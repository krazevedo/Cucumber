#encoding: utf-8 
#!/usr/bin/env ruby

Dado(/^que (?:|eu) entre no (.+)$/) do |page_name|
  	visit path_to(page_name)
  	logar_no_google
end

Quando(/^card deverá estar criado no Smart Canvas$/) do
	validar_card_criado
end