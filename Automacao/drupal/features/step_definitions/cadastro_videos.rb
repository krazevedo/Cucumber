#encoding: utf-8 
#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "table"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "wait_ajax"))


Quando(/^selecionar a categoria "([^"]*)" no combobox$/) do |field|
  select(field)
end

Quando(/^informar a imagem "([^"]*)"$/) do |value|
  first("a[id*='-browse-button']").click  
  	within_frame("mediaBrowser") do
	  attach_file("edit-upload-upload", "/home/likewise-open/CIT/kaior/Downloads/" + "#{value}")
	  click_button("Upload")
	  wait_for_button
	  click_button("Próximo")
	  click_button("Salvar")	  	  
	end
end

Quando(/^informar no campo "([^"]*)" a URL do vídeo "([^"]*)"$/) do |field, value|
  fill_in(field, :with => value)
end