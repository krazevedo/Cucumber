#encoding: utf-8 
#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "table"))


Quando(/^informar na posição "([^"]*)" a imagem de fundo "([^"]*)"$/) do |pos, value|
  first("a[id*='#{pos}-und-0-browse-button']").click  
  	within_frame("mediaBrowser") do
	  attach_file("edit-upload-upload", "/home/likewise-open/CIT/kaior/img/" + "#{value}")
	  click_button("Upload")
	  click_button("Próximo")
	  click_button("Salvar")	  
	end
end

Quando(/^informar os parametros no campo "([^"]*)"$/) do |field|
	@parametros = "data-android_passo_1=\"-3,0\"\ndata-android_passo_2=\"0,0\"\ndata-android_passo_3=\"-15,0\"\ndata-android_passo_4=\"0,0\"\ndata-ipad_passo_1=\"0,0\"\ndata-ipad_passo_2=\"10,-3\"\ndata-ipad_passo_3=\"0,0\"\ndata-ipad_passo_4=\"15,0\"\ndata-iemargin_url=\"0,0\"\ndata-iemargin_nome=\"0,0\"\n\ndata-nome=\"140,468\"\ndata-canvasnome=\"400,945\"\ndata-url=\"246,442\"\ndata-canvasurl=\"400,895\"\ndata-canvascolor=\"#ffffff\"\ndata-telefone=\"110,510\"\ndata-canvastelefone=\"400,1020\"\ndata-email=\"183,510\"\ndata-canvasemail=\"400,1000\"\n\ndata-finaltext=\"__url__<br />__nome__<br />__franquia__ Digital Natura<br />__telefone__ | __email__\"\ndata-finalfontsize=\"25\"\ndata-finaltextalign=\"center\"\ndata-franqueadomaixy=\"38\"\ndata-order=\"link,nome,telefone,email\"\ndata-print=\"natura_2_print.jpg\"\ndata-botoes=\"0,1,2\"\n\ndata-lightbox=\"O seu folheto está pronto!\"\ndata-zoommobile=\"1\"\ndata-impressanomebold=\"1\"\ndata-impressaurlbold=\"1\"\ndata-impressanome=\"700,2190\"\ndata-impressaurl=\"450,2060\"\ndata-impressatelefone=\"500,2345\"\ndata-impressaemail=\"800,2300\"\ndata-impressatelefoneeemailjunto=\"1\"\ndata-impressanome_size=\"40\"\ndata-impressaurl_size=\"36\"\ndata-impressatelefone_size=\"40\"\ndata-impressaemail_size=\"40\"\ndata-render-url=\"true\"\ndata-has-tel-and-email=\"true\""
	fill_in(field, :with => @parametros)
end
