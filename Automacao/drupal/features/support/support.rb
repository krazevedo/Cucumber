module Support

	def login
	  	fill_in("edit-name", :with => "naturamasteruser")
   		fill_in("edit-pass", :with => "S1t3Adm1n99;")
   		click_button("edit-submit")
	end

	def configuracao(idioma, segmento)
	  	select(idioma)
	  	if find("select[id$='segment-und']").has_css?("option[selected]") != true then
	  		find("select[id$='segment-und']").find("option[value='#{segmento}']").click
	  	end
    end

	def imagem(file)
	  first("a[id*='-browse-button']").click  
	  within_frame("mediaBrowser") do
	  	attach_file("edit-upload-upload", "/home/likewise-open/CIT/kaior/img_painel_fase2/" + file)
	  	click_button("Upload")
	  	alert = page.driver.browser.switch_to.alert rescue Selenium::WebDriver::Error::NoAlertOpenError
			  	if alert != Selenium::WebDriver::Error::NoAlertOpenError then
			  		page.driver.browser.switch_to.alert.accept
			  		click_button("Upload")
			  	end
	  	wait_for_button
	  	click_button("Próximo")
	  	alert = page.driver.browser.switch_to.alert rescue Selenium::WebDriver::Error::NoAlertOpenError
			  	if alert != Selenium::WebDriver::Error::NoAlertOpenError then
			  		page.driver.browser.switch_to.alert.accept
			  	end
	  	
	  	click_button("Salvar")	  	  
	   end
	end

	def imagem_arquivos(file)
	  	attach_file("edit-upload-upload", "/home/likewise-open/CIT/kaior/img_painel_fase2/" + file)
	  	click_button("Upload")
	  	alert = page.driver.browser.switch_to.alert rescue Selenium::WebDriver::Error::NoAlertOpenError
			  	if alert != Selenium::WebDriver::Error::NoAlertOpenError then
			  		page.driver.browser.switch_to.alert.accept
			  		click_button("Upload")
			  	end
	  	wait_for_button
	  	click_button("Próximo")
	  	alert = page.driver.browser.switch_to.alert rescue Selenium::WebDriver::Error::NoAlertOpenError
			  	if alert != Selenium::WebDriver::Error::NoAlertOpenError then
			  		page.driver.browser.switch_to.alert.accept
			  	end
	  	click_button("Próximo")
	  	alert = page.driver.browser.switch_to.alert rescue Selenium::WebDriver::Error::NoAlertOpenError
			  	if alert != Selenium::WebDriver::Error::NoAlertOpenError then
			  		page.driver.browser.switch_to.alert.accept
			  	end
	  	click_button("Salvar")	 
	end

	def passos(data, vnum)
	   vezes = 0
	   for i in (1..5) do
	   	if data['passo' + i.to_s][vnum].to_s != "nil" then
       		vezes = vezes + 1
       	end
       end
       
       for i in (0..vezes-1) do
       	find("input[id$='steps-und-#{i}-value']").native.send_keys(data['passo' + (i+1).to_s][vnum].to_s)
       	click_button("Adicionar outro item")       	
       end
    end

    def imagem_conteudo_digital(data, vnum)
    	vezes = 0
	   for i in (1..5) do
	   	if data['imagem' + i.to_s][vnum].to_s != "nil" then
       		vezes = vezes + 1
       	end
       end

	   for i in (1..vezes) do
	   	first("a[id*='-browse-button']").click  
       	    alert = page.driver.browser.switch_to.alert rescue Selenium::WebDriver::Error::NoAlertOpenError
			  	if alert != Selenium::WebDriver::Error::NoAlertOpenError then
			  		page.driver.browser.switch_to.alert.accept
			  	end
		  	within_frame("mediaBrowser") do
		  		alert = page.driver.browser.switch_to.alert rescue Selenium::WebDriver::Error::NoAlertOpenError
			  	if alert != Selenium::WebDriver::Error::NoAlertOpenError then
			  		page.driver.browser.switch_to.alert.accept
			  	end
			  	attach_file("edit-upload-upload", "/home/likewise-open/CIT/kaior/img_painel_fase2/" + data['imagem' + (i).to_s][vnum].to_s)
			  	alert = page.driver.browser.switch_to.alert rescue Selenium::WebDriver::Error::NoAlertOpenError
			  	if alert != Selenium::WebDriver::Error::NoAlertOpenError then
			  		page.driver.browser.switch_to.alert.accept
			  	end
			  	click_button("Upload")
			  	alert = page.driver.browser.switch_to.alert rescue Selenium::WebDriver::Error::NoAlertOpenError
			  	if alert != Selenium::WebDriver::Error::NoAlertOpenError then
			  		page.driver.browser.switch_to.alert.accept
			  		click_button("Upload")
			  	end
			  	wait_for_button
			  	click_button("Próximo")
			  	alert = page.driver.browser.switch_to.alert rescue Selenium::WebDriver::Error::NoAlertOpenError
			  	if alert != Selenium::WebDriver::Error::NoAlertOpenError then
			  		page.driver.browser.switch_to.alert.accept
			  	end
			  	click_button("Salvar")	  	  
		   end    
		   sleep(1)	
       end
    end
end

World(Support)