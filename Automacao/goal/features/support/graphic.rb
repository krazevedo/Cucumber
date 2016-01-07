module Graphic

	def calcula_quantidade_de_itens(report)
		#Calculo da quantidade de linhas da tabela da drill
		@rows = all("div#tableview > div > div > table > tbody > tr").count
		#calculo da quantidade de colunas da tabela da drill
		@collumns = all("div#tableview > div > div > table > thead > tr > th").count
		verifica_tipo_relatorio(report)
		#Calculo da quantidade de valores no gráfico
		case @report
			when "Coluna" 
				@values = all("svg > g:nth-child(4) > g:nth-child(2) > g:nth-child(2) > text").count
			when "Linha", "Coluna com linha de meta"
				@values = all("svg > g:nth-child(4) > g:nth-child(5) > * > g > g > text:nth-child(2)").count
			when "Pizza"
				@values = all("svg > g > g > g").count				
		end			
	end	

	def obter_valores_drill(report)
		verifica_grafico_KPI_performance_review(report)
		case @metrics
			when true
				@drill_sprint = all("div#tableview > div > div > table > tbody > tr > td:nth-child(3)").collect(&:text)
				#pega os valores da coluna 4 concatena com os valores da coluna 5 e retira os 0
				@drill_value = all("div#tableview > div > div > table > tbody > tr > td:nth-child(4)").collect(&:text).concat(all("div#tableview > div > div > table > tbody > tr > td:nth-child(5)").collect(&:text)).delete_if{|value| value == "0"}	
			else 
				@drill_sprint = all("div#tableview > div > div > table > tbody > tr > td:nth-child(2)").collect(&:text)
				@drill_value = Array.new()
				for i in 3..@collumns
					@drill_value += all("div#tableview > div > div:nth-child(1) > table > tbody > tr > td:nth-child(#{i})").collect(&:text).delete_if{|value| value == "0"}	
					#@drill_value += all("div#tableview > div > div:nth-child(1) > table > tbody > tr > td:nth-child(#{i})").collect(&:text) 
				end	
		end	
	end

	def obter_valores_grafico(report)
		verifica_grafico_KPI_performance_review(report)
		case @report
			when "Coluna" 
				pegar_valores_eixo_x
				@graph_value = all("svg > g:nth-child(4) > g:nth-child(2) > g:nth-child(2) > text").collect(&:text).delete_if{|value| value == "0"}
			when "Linha", "Coluna com linha de meta"
				pegar_valores_eixo_x
				@graph_value = all("svg > g:nth-child(4) > g:nth-child(5) > * > g > g > text:nth-child(1), svg > g:nth-child(4) > g:nth-child(5) > * > g > text:nth-child(1)").collect(&:text).delete_if{|value| value == "0"}
				#@graph_value = all("svg > g:nth-child(4) > g:nth-child(5) > * > g > * > text:nth-child(1)").collect(&:text)
			when "Pizza"
				alterar_grafico_para_coluna
				pegar_valores_eixo_x
				@graph_value = Array.new()
				for i in 1..@values
					find("svg > g:nth-child(4) > g:nth-child(2) > g:nth-child(2) > rect:nth-child(#{i})").hover
					@graph_value += [find("svg > g:nth-child(5) > g > g:nth-child(5) > text:nth-child(2)").text]
				end				
		end		
	end

	def comparar_grafico_e_drill
		for i in 0..@rows-1
			expect(@drill_sprint[i].gsub(/\s+/, "")).to eq @graph_sprint[i].gsub(/\s+/, "")
		end	
		for i in 0..@values-1
			expect(@drill_value[i]).to eq @graph_value[i]
		end
		Capybara::Screenshot.screenshot_and_save_page
	end	

	def verificar_metrics_status(status)
		case status
			when "inativo"
				expect(has_css?(".notapplicable")).to eq true
			when "ativo"
				expect(has_css?(".unsubmitted")).to eq true
			when "endorsed"
				expect(has_css?(".endorsed")).to eq true
			when "disagree"
				expect(has_css?(".disagree")).to eq true
		end
		Capybara::Screenshot.screenshot_and_save_page
	end

	def clicar_no_botao_status
		find("div#tableview tr td:nth-child(2) i").click
	end
end

World(Graphic)