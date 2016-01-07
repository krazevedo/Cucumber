#encoding: utf-8 
#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "table"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "support"))

Quando(/^deveria cadastrar os artigos no drupal$/) do |table|
   login
   data =  retorna_tabela_hash(table)
   count = data['titulo'].size.to_i
    count.times do | vnum |
       visit path_to("artigos")
       fill_in("edit-title", :with => data['titulo'][vnum].to_s)
       configuracao(data['idioma'][vnum].to_s, data['segmento'][vnum].to_s)
       check(data['categoria'][vnum].to_s)
       select("HTML")
       fill_in("edit-field-lma-content-und-0-value", :with => data['conteudo'][vnum].to_s)
       alert = page.driver.browser.switch_to.alert rescue Selenium::WebDriver::Error::NoAlertOpenError
	  	if alert != Selenium::WebDriver::Error::NoAlertOpenError then
	  		page.driver.browser.switch_to.alert.accept
	  	end
       click_button("Publicar")
       alert = page.driver.browser.switch_to.alert rescue Selenium::WebDriver::Error::NoAlertOpenError
	  	if alert != Selenium::WebDriver::Error::NoAlertOpenError then
	  		page.driver.browser.switch_to.alert.accept
	  		click_button("Publicar")
	  	end
       expect(page).to have_content(data['titulo'][vnum].to_s)
  end
end

Quando(/^deveria cadastrar os banners no drupal$/) do |table|
   login
   data =  retorna_tabela_hash(table)
   count = data['titulo'].size.to_i
    count.times do | vnum |
       visit path_to("banner")
       find("*[id=edit-title]").click  
  	   fill_in("edit-title", :with => data['titulo'][vnum].to_s)       
       configuracao(data['idioma'][vnum].to_s, data['segmento'][vnum].to_s)
       fill_in("edit-field-bhc-content-und-0-value", :with => data['texto'][vnum].to_s)
       fill_in("edit-field-bhc-link-und-0-title", :with => data['botao'][vnum].to_s)
       fill_in("edit-field-bhc-link-und-0-url", :with => data['link'][vnum].to_s)
       imagem(data['imagem'][vnum].to_s)	  	
       click_button("Publicar")
       expect(page).to have_content(data['titulo'][vnum].to_s)
  end
end

Quando(/^deveria cadastrar os vídeos no drupal$/) do |table|
   login
   data =  retorna_tabela_hash(table)
   count = data['titulo'].size.to_i
    count.times do | vnum |
       visit path_to("videos")
       find("*[id=edit-title]").click  
  	   fill_in("edit-title", :with => data['titulo'][vnum].to_s)       
       configuracao(data['idioma'][vnum].to_s, data['segmento'][vnum].to_s)
       select(data['categoria'][vnum].to_s)
       fill_in("edit-field-lmv-video-link-und-0-value", :with => data['link'][vnum].to_s)
       imagem(data['imagem'][vnum].to_s)
       fill_in("edit-field-lmv-publication-date-und-0-value-datepicker-popup-0", :with => data['data'][vnum].to_s )	  	
       click_button("Publicar")
       #expect(page).to have_content(data['titulo'][vnum].to_s)
  end
end

Quando(/^deveria cadastrar os materiais no drupal$/) do |table|
   login
   data =  retorna_tabela_hash(table)
   count = data['titulo'].size.to_i
    count.times do | vnum |
       visit path_to("material de apoio")
       find("*[id=edit-title]").click  
  	   fill_in("edit-title", :with => data['titulo'][vnum].to_s)       
       configuracao(data['idioma'][vnum].to_s, data['segmento'][vnum].to_s)
       fill_in("edit-field-sm-subtitle-und-0-value", :with => data['texto'][vnum].to_s)
       fill_in("edit-field-sm-link-und-0-title", :with => data['botao'][vnum].to_s)
       imagem(data['imagem'][vnum].to_s)
       fill_in("edit-field-sm-link-und-0-url", :with => data['link'][vnum].to_s )	  	
       click_button("Publicar")
       expect(page).to have_content(data['titulo'][vnum].to_s)
  end
end

Quando(/^deveria cadastrar a FAQ no drupal$/) do |table|
   login
   data =  retorna_tabela_hash(table)
   count = data['titulo'].size.to_i
    count.times do | vnum |
       visit path_to("faq")
       fill_in("edit-title", :with => data['titulo'][vnum].to_s)
       configuracao(data['idioma'][vnum].to_s, data['segmento'][vnum].to_s)
       select(data['categoria'][vnum].to_s)
       select("HTML")
       fill_in("edit-body-und-0-value", :with => data['texto'][vnum].to_s)
       click_button("Publicar")
       expect(page).to have_content(data['titulo'][vnum].to_s)
  end
end

Quando(/^deveria cadastrar os conteudos digitais no drupal$/) do |table|
   login
   data =  retorna_tabela_hash(table)
   count = data['titulo'].size.to_i
    count.times do | vnum |
       visit path_to("conteúdo digital")
       find("*[id=edit-title]").click  
  	   fill_in("edit-title", :with => data['titulo'][vnum].to_s)       
       configuracao(data['idioma'][vnum].to_s, data['segmento'][vnum].to_s)
       fill_in("edit-field-cdg-description-und-0-value", :with => data['texto'][vnum].to_s)
       fill_in("edit-field-cdg-button-label-und-0-value", :with => data['botao'][vnum].to_s)
       fill_in("edit-field-cdg-external-url-und-0-value", :with => data['url'][vnum].to_s)
       imagem_conteudo_digital(data, vnum)
       passos(data, vnum)
       fill_in("edit-field-cdg-parameters-und-0-value", :with => data['parametros'][vnum].to_s)
       click_button("Publicar")
       expect(page).to have_content(data['titulo'][vnum].to_s)
  end
end

Quando(/^deveria cadastrar as imagens no drupal$/) do |table|
   login
   data =  retorna_tabela_hash(table)
   count = data['imagem'].size.to_i
    count.times do | vnum |
       visit path_to("imagens")
       imagem_arquivos(data['imagem'][vnum].to_s)
       #expect(page).to have_content(data['titulo'][vnum].to_s)
       sleep(1)
  end
end