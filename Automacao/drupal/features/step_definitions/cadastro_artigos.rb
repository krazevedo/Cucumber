#encoding: utf-8 
#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "table"))


Quando(/^eu acessar (.+)$/) do |page_name|
	visit path_to(page_name)
end

Quando(/^clicar no botão "([^"]*)"$/) do |field|
	click_button(field)
end

Quando(/^informar no campo "([^"]*)" com "([^"]*)"$/) do |field, value|
  	if field == 'edit-title' then
  		@title = value  	 	
  	end

  	find("*[id=#{field}]").click  
  	fill_in(field, :with => value)
end

Quando(/^informar no campo "([^"]*)" a url "([^"]*)"$/) do |field, value|
  	find("*[id=#{field}]").click  
  	fill_in(field, :with => value)  		
end

Quando(/^informar no conteúdo "([^"]*)"$/) do |value|
	@field = find("iframe[id*='_ifr']")[:id]
	within_frame("#{@field}") do
	  editor = page.find_by_id('tinymce')
	  editor.native.send_keys(value)
	end
end

Então(/^deverá ser criado com sucesso$/) do
	expect(page).to have_text("#{@title}")
end

Quando(/^selecionar "([^"]*)"$/) do |field|
	check(field)
end

Quando(/^selecionar o segmento "([^"]*)"$/) do |field|
	unselect("Generic")
	select(field)
end

Quando(/^selecionar o idioma "([^"]*)"$/) do |field|
	select(field)
end

Quando(/^informar imagem no conteúdo "([^"]*)"$/) do |value|
	
	within ("table[id*='-value_toolbar1']") do
	  find('span.mceIcon.mce_media').click  
	end 

	within_frame("mediaBrowser") do
	  attach_file("edit-upload-upload", "/home/likewise-open/CIT/kaior/Downloads/" + "#{value}")
	  click_button("Upload")
	  wait_for_button
	  click_button("Próximo")
	  click_button("Próximo")
	  click_button("Salvar")	  	  
	end

	within_frame ('mediaStyleSelector') do
	  find("a.button.fake-ok").click
	end 
end

Quando(/^informar video no conteúdo "([^"]*)"$/) do |value|
	
	within ("table[id*='-value_toolbar1']") do
	  find('span.mceIcon.mce_media').click  
	end 

	within_frame("mediaBrowser") do
	  find_by_id('ui-id-2').click
	  fill_in('edit-embed-code', :with => "#{value}")
	  click_button("Próximo")
	  find_by_id('edit-type-video').click
  	  click_button("Próximo")
  	  click_button("Próximo")
  	  click_button("Salvar")
	end

	within_frame ('mediaStyleSelector') do
	  find("a.button.fake-ok").click
	end 
end	