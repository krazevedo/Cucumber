module PML

	def responder_pml_not_submitted(language)
		find("div div.cardPanel div.draft", :text => "(Not Submitted)").click
		if find("div#LanguageId_chosen a span").text == language then
			fill_in("Cycle", :with => "Nov/2015")
			click_button("NEXT") 
		else 
			find_by_id("LanguageId_chosen").click
			find("div#LanguageId_chosen > div > ul > li", :text => language).click
			fill_in("Cycle", :with => "Nov/2015")
			click_button("NEXT") 
			find("a.linkbutton.confirm").click
			has_no_selector?("div#request-loading", :visible => true)
			has_selector?("form#editForm table tbody tr")
		end
  	end

  	def responder_pml_new_evaluation(language)
		find("a", :text => "NEW EVALUATION").click 
		find_by_id("LanguageId_chosen").click
		find("div#LanguageId_chosen div ul li", :text => language).click
		fill_in("Cycle", :with => "Nov/2015")
		click_button("NEXT")
		find("a.linkbutton.confirm").click
		has_no_selector?("div#request-loading", :visible => true)
		has_selector?("form#editForm table tbody tr")
  	end

  	def responder_avaliacao(level)
  		within_frame("PML_EValuationFrame") do
	  		perguntas_level1 = all("table > tbody > tr.pml-level-9").count
	  		perguntas_level2 = all("table > tbody > tr.pml-level-10").count
	  		perguntas_level3 = all("table > tbody > tr.pml-level-11").count
	  		perguntas_level4 = all("table > tbody > tr.pml-level-12").count
	  		@total_perguntas = perguntas_level1 + perguntas_level2 + perguntas_level3 + perguntas_level4

		  	case level
	  		when "0"
	  			@perguntas = perguntas_level1
	  		when "1"
	  			@perguntas = perguntas_level1 + perguntas_level2
	  		when "2"
	  			@perguntas = perguntas_level1 + perguntas_level2 + perguntas_level3
	  		when "3" , "4"
	  			@perguntas = @total_perguntas
	  		end
		  	for i in 0..@total_perguntas-1
	  			page.execute_script("$('select#Answers_#{i}__AnswerId')[0].scrollIntoView(true);")
	  			find_by_id("Answers_#{i}__AnswerId").click  
	  			if i >= @perguntas-1 and level != "4"
					select("Não", :from => "Answers_#{i}__AnswerId")
				elsif i == @perguntas-1 and level == "4" 
					select("Sim", :from => "Answers_#{i}__AnswerId")
					@perguntas +=1
				else
					select("Sim", :from => "Answers_#{i}__AnswerId")
				end
			end
			salvar_evaluation
	  	end 		
  	end

  	def validar_porcentagem_nivel
  		within_frame("PML_EValuationFrame") do
  			case @perguntas
  			when 5
  				porcentagem = "0.80 - Not Compliant"
  			when 29
  				porcentagem = "1.96 - Foundation"
  			when 39
  				porcentagem = "2.90 - Accuracy"
  			when 43
  				porcentagem = "3.75 - Improvement"
  			when 44
  				porcentagem = "4.00 - Transformation"
  			end
  			expect(find("div:nth-child(1) > div > div.cardPanel > div.current-pml > span").text).to eq porcentagem
		end 
  	end

  	def validar_cor_nivel
  		within_frame("PML_EValuationFrame") do
  			case @perguntas
  			when 5
  				cor = "rgba(255, 0, 0, 1)" #vermelho
  			when 29
  				cor = "rgba(255, 255, 0, 1)" #amarelo
  			when 39
  				cor = "rgba(255, 165, 0, 1)" #laranja
  			when 43
  				cor = "rgba(0, 128, 0, 1)" #verde
  			when 44
  				cor = "rgba(0, 0, 255, 1)" #azul
  			end
  			expect(find("div:nth-child(1) > div > div.cardPanel > div.current-pml > span").native.style('background-color')).to eq cor
		end 
  	end

  	def submeter_evaluation(type)
		click_button("Submit")
		find("a.linkbutton.confirm").click
		visit path_to("pml")
		selecionar_customer_e_flow("CI&T", type)
  	end

  	def salvar_evaluation
		click_button("Save")
		page.has_no_selector?("div#request-loading", :visible => true)
		sleep(0.5)
		find("a.linkbutton.confirm").click			
 	end

  	def obter_perguntas_pml_admin(type)
  		#Conto todas as linhas e colunas do grid de perguntas
		 total_admin = all("table:nth-child(9) tbody tr td").count
		#Pego todas as informações do grid
		 total = all("table:nth-child(9) tbody tr td").collect(&:text)
		 $perguntas_admin_pt = Array.new 
		 $perguntas_admin_en = Array.new 
		 i = 0
		 while i < total_admin 
		 	if total[i+2].include?(type) then #Verifico se na coluna de tipos possui o tipo desejado
		 		$perguntas_admin_pt += [total[i+4]] #Adiciono no array a pergunta em português
		 		$perguntas_admin_en += [total[i+6]] #Adiciono no array a pergunta em inglês
		 	end
		 	i += 8
		 end
  	end

  	def obter_perguntas_pml_evaluation()
  		#Conto todas as linhas do grid de perguntas
  		$total_evaluation = all("form#editForm table tbody tr").count
		$perguntas_evaluation = Array.new 
		for i in 1..$total_evaluation #Percorro pelas linhas
			within("form#editForm table tbody tr:nth-child(#{i})") do
				$perguntas_evaluation += [find("td:nth-child(5)").text]	#Adiciono a pergunta no array			
			end					
		end 
  	end

  	def comparar_perguntas_pt()
  		esta_contido = nil
  		i = 0
  		while i < $total_evaluation
  			esta_contido = false
  			$perguntas_evaluation.each do |x|  #Percorro o array de perguntas da avaliação
  				if (x == $perguntas_admin_pt[i]) == false && esta_contido == false then #Verifico se a pergunta do admin está contida nas perguntas da avaliação
					esta_contido = false
				else esta_contido = true
				end				
			end
			i += 1
			raise "Versões não compativeis. Pergunta incompatível #{$perguntas_admin_pt[i]}" if esta_contido == false		
		end
		Capybara::Screenshot.screenshot_and_save_page
	end

	def comparar_perguntas_en()
  		esta_contido = nil
  		i = 0
  		while i < $total_evaluation
  			esta_contido = false
  			$perguntas_evaluation.each do |x|  
  				if (x == $perguntas_admin_en[i]) == false && esta_contido == false then
					esta_contido = false
				else esta_contido = true
				end				
			end  
			i += 1
			raise "Versões não compativeis. Pergunta incompatível #{$perguntas_admin_en[i]}" if esta_contido == false 			
		end
		Capybara::Screenshot.screenshot_and_save_page
	end

	def verificar_new_evaluation_ou_not_submitted(type, language)
		#Verifico se tem card Não Submetido
		if has_css?("div div.cardPanel div.draft", :text => "(Not Submitted)") == true then
			#Verifico se a versão do card é igual a nova versão
			if first("div > div.cardPanel").has_css?("div", :text => "Evaluation #{$version}") == true then
			 	responder_pml_not_submitted(language) #Se for entro no card Não submetido
			else #Se não for entro no card não submetido submeto a avaliação e entro na nova avaliação
				responder_pml_not_submitted(language)
				submeter_evaluation(type)
				within_frame("PML_EValuationFrame") do
					responder_pml_new_evaluation(language)
				end
			end
		else  #Se não tiver nenhum card não submetido entro na nova avaliação
			 responder_pml_new_evaluation(language)
		end	
	end
  	
end

World(PML)