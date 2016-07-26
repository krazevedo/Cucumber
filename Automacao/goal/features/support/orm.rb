module ORM

	def selecionar_última_versao
		grid_versions = all("table > tbody > tr")
		new_version = grid_versions[0].all("td")
		new_version[3].find_button("Details").click
	end

	def editar_última_versao
		if has_selector?('a', :text => 'EDIT') == true
			then find('a', :text => 'EDIT').click	
		else click_button("createORM")
			 find('a', :text => 'YES').click
			 wait_no_loading
		end
	end

	def setar_variaveis
		$perguntas_execucao_level_1_sim = $perguntas_execucao_level_1_nao = $perguntas_execucao_level_2_sim = $perguntas_execucao_level_2_nao = $perguntas_execucao_level_3_sim = $perguntas_execucao_level_3_nao = $perguntas_execucao_level_4_sim = $perguntas_execucao_level_4_nao = 0
		$perguntas_gerenciamento_level_1_sim = $perguntas_gerenciamento_level_1_nao = $perguntas_gerenciamento_level_2_sim = $perguntas_gerenciamento_level_2_nao = $perguntas_gerenciamento_level_3_sim = $perguntas_gerenciamento_level_3_nao = $perguntas_gerenciamento_level_4_sim = $perguntas_gerenciamento_level_4_nao = 0
		$perguntas_arquitetura_level_1_sim = $perguntas_arquitetura_level_1_nao = $perguntas_arquitetura_level_2_sim = $perguntas_arquitetura_level_2_nao = $perguntas_arquitetura_level_3_sim = $perguntas_arquitetura_level_3_nao = $perguntas_arquitetura_level_4_sim = $perguntas_arquitetura_level_4_nao = 0
		$perguntas_performance_level_1_sim = $perguntas_performance_level_1_nao = $perguntas_performance_level_2_sim = $perguntas_performance_level_2_nao = $perguntas_performance_level_3_sim = $perguntas_performance_level_3_nao = $perguntas_performance_level_4_sim = $perguntas_performance_level_4_nao = 0
		$perguntas_evaluation = Array.new 
	end

	def somar_respostas_por_grupo
		#Conto todas as linhas do grid de perguntas
		$total_evaluation = all("form#editForm table tbody tr").count
		for i in 1..$total_evaluation #Percorro pelas linhas
			within("form#editForm table tbody tr:nth-child(#{i})") do
				page.execute_script("$('table tbody tr:nth-child(#{i})')[0].scrollIntoView(true);")
				level = find("td:nth-child(2)").text
				grupo = find("td:nth-child(3)").text
				case  level
					when "1 - Foundation"
						case  grupo
							when "Ready", "Controle de Qualidade", "Agile & Flow", "Done", "Controle de Performance", "Skill and Knowledge", "ITIL Execution"
								if has_selector?("td:nth-child(7) select option[selected='selected") then
									if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
									then $perguntas_execucao_level_1_sim += 1
									else $perguntas_execucao_level_1_nao += 1
									end
								else $perguntas_execucao_level_1_nao += 1
								end
								if grupo == "Controle de Performance" then
									if has_selector?("td:nth-child(7) select option[selected='selected") then
										if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
										then $perguntas_performance_level_1_sim += 1
										else $perguntas_performance_level_1_nao += 1
										end
									else $perguntas_performance_level_1_sim += 1
									end
								end
							when "Escopo", "Governança de Suporte", "Riscos", "Custo", "Comunicação", "Diferenciação"
								if has_selector?("td:nth-child(7) select option[selected='selected") then
									if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
									then $perguntas_gerenciamento_level_1_sim += 1
									else $perguntas_gerenciamento_level_1_nao += 1
									end
								else $perguntas_gerenciamento_level_1_nao += 1
								end
							when "Arquitetura"
								if has_selector?("td:nth-child(7) select option[selected='selected") then
									if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
									then $perguntas_arquitetura_level_1_sim += 1
									else $perguntas_arquitetura_level_1_nao += 1
									end
								else $perguntas_arquitetura_level_1_nao += 1
								end
						end
					when "2 - Accuracy"
						case  grupo
							when "Ready", "Controle de Qualidade", "Agile & Flow", "Done", "Controle de Performance", "Skill and Knowledge", "ITIL Execution"
								if has_selector?("td:nth-child(7) select option[selected='selected") then
									if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
									then $perguntas_execucao_level_2_sim += 1
									else $perguntas_execucao_level_2_nao += 1
									end
								else $perguntas_execucao_level_2_nao += 1
								end
								if grupo == "Controle de Performance" then
									if has_selector?("td:nth-child(7) select option[selected='selected") then
										if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
										then $perguntas_performance_level_2_sim += 1
										else $perguntas_performance_level_2_nao += 1
										end
									else $perguntas_performance_level_2_sim += 1
									end
								end
							when "Escopo", "Governança de Suporte", "Riscos", "Custo", "Comunicação", "Diferenciação"
								if has_selector?("td:nth-child(7) select option[selected='selected") then
									if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
									then $perguntas_gerenciamento_level_2_sim += 1
									else $perguntas_gerenciamento_level_2_nao += 1
									end
								else $perguntas_gerenciamento_level_2_nao += 1
								end
							when "Arquitetura"
								if has_selector?("td:nth-child(7) select option[selected='selected") then
									if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
									then $perguntas_arquitetura_level_2_sim += 1
									else $perguntas_arquitetura_level_2_nao += 1
									end
								else $perguntas_arquitetura_level_2_nao += 1
								end
						end
					when "3 - Improvement"
						case  grupo
							when "Ready", "Controle de Qualidade", "Agile & Flow", "Done", "Controle de Performance", "Skill and Knowledge", "ITIL Execution"
								if has_selector?("td:nth-child(7) select option[selected='selected") then
									if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
									then $perguntas_execucao_level_3_sim += 1
									else $perguntas_execucao_level_3_nao += 1
									end
								else $perguntas_execucao_level_3_nao += 1
								end
								if grupo == "Controle de Performance" then
									if has_selector?("td:nth-child(7) select option[selected='selected") then
										if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
										then $perguntas_performance_level_3_sim += 1
										else $perguntas_performance_level_3_nao += 1
										end
									else $perguntas_performance_level_3_sim += 1
									end
								end
							when "Escopo", "Governança de Suporte", "Riscos", "Custo", "Comunicação", "Diferenciação"
								if has_selector?("td:nth-child(7) select option[selected='selected") then
									if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
									then $perguntas_gerenciamento_level_3_sim += 1
									else $perguntas_gerenciamento_level_3_nao += 1
									end
								else $perguntas_gerenciamento_level_3_nao += 1
								end
							when "Arquitetura"
								if has_selector?("td:nth-child(7) select option[selected='selected") then
									if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
									then $perguntas_arquitetura_level_3_sim += 1
									else $perguntas_arquitetura_level_3_nao += 1
									end
								else $perguntas_arquitetura_level_3_nao += 1
								end
						end		
					when "4 - Transformation"
						case  grupo
							when "Ready", "Controle de Qualidade", "Agile & Flow", "Done", "Controle de Performance", "Skill and Knowledge", "ITIL Execution"
								if has_selector?("td:nth-child(7) select option[selected='selected") then
									if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
									then $perguntas_execucao_level_4_sim += 1
									else $perguntas_execucao_level_4_nao += 1
									end
								else $perguntas_execucao_level_4_nao += 1
								end
								if grupo == "Controle de Performance" then
									if has_selector?("td:nth-child(7) select option[selected='selected") then
										if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
										then $perguntas_performance_level_4_sim += 1
										else $perguntas_performance_level_4_nao += 1
										end
									else $perguntas_performance_level_4_nao += 1
									end
								end
							when "Escopo", "Governança de Suporte", "Riscos", "Custo", "Comunicação", "Diferenciação"
								if has_selector?("td:nth-child(7) select option[selected='selected") then
									if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
									then $perguntas_gerenciamento_level_4_sim += 1
									else $perguntas_gerenciamento_level_4_nao += 1
									end
								else $perguntas_gerenciamento_level_4_nao += 1
								end
							when "Arquitetura"
								if has_selector?("td:nth-child(7) select option[selected='selected") then
									if find("td:nth-child(7) select option[selected='selected']").text == "SIM"
									then $perguntas_arquitetura_level_4_sim += 1
									else $perguntas_arquitetura_level_4_nao += 1
									end		
								else $perguntas_arquitetura_level_4_sim += 1
								end						
						end									
				end	
			end				
		end
	end

	def calcular_porcentagem
		$porcentagem_execucao, $porcentagem_arquitetura, $porcentagem_gerenciamento = Array.new, Array.new, Array.new
			
		$porcentagem_execucao += [($perguntas_execucao_level_1_sim.to_f / ($perguntas_execucao_level_1_sim + $perguntas_execucao_level_1_nao).to_f).round(2)]
		$porcentagem_execucao += [($perguntas_execucao_level_2_sim.to_f / ($perguntas_execucao_level_2_sim + $perguntas_execucao_level_2_nao).to_f).round(2)]
		$porcentagem_execucao += [($perguntas_execucao_level_3_sim.to_f / ($perguntas_execucao_level_3_sim + $perguntas_execucao_level_3_nao).to_f).round(2)]
		$porcentagem_execucao += [($perguntas_execucao_level_4_sim.to_f / ($perguntas_execucao_level_4_sim + $perguntas_execucao_level_4_nao).to_f).round(2)]

		$porcentagem_arquitetura += [($perguntas_arquitetura_level_1_sim.to_f / ($perguntas_arquitetura_level_1_sim + $perguntas_arquitetura_level_1_nao).to_f).round(2)]
		$porcentagem_arquitetura += [($perguntas_arquitetura_level_2_sim.to_f / ($perguntas_arquitetura_level_2_sim + $perguntas_arquitetura_level_2_nao).to_f).round(2)]
		$porcentagem_arquitetura += [($perguntas_arquitetura_level_3_sim.to_f / ($perguntas_arquitetura_level_3_sim + $perguntas_arquitetura_level_3_nao).to_f).round(2)]
		$porcentagem_arquitetura += [($perguntas_arquitetura_level_4_sim.to_f / ($perguntas_arquitetura_level_4_sim + $perguntas_arquitetura_level_4_nao).to_f).round(2)]

		$porcentagem_gerenciamento += [($perguntas_gerenciamento_level_1_sim.to_f / ($perguntas_gerenciamento_level_1_sim + $perguntas_gerenciamento_level_1_nao).to_f).round(2)]
		$porcentagem_gerenciamento += [($perguntas_gerenciamento_level_2_sim.to_f / ($perguntas_gerenciamento_level_2_sim + $perguntas_gerenciamento_level_2_nao).to_f).round(2)]
		$porcentagem_gerenciamento += [($perguntas_gerenciamento_level_3_sim.to_f / ($perguntas_gerenciamento_level_3_sim + $perguntas_gerenciamento_level_3_nao).to_f).round(2)]
		$porcentagem_gerenciamento += [($perguntas_gerenciamento_level_4_sim.to_f / ($perguntas_gerenciamento_level_4_sim + $perguntas_gerenciamento_level_4_nao).to_f).round(2)]

		$porcentagem_performance = ($perguntas_performance_level_1_sim.to_f + $perguntas_performance_level_2_sim.to_f + $perguntas_performance_level_3_sim.to_f + $perguntas_performance_level_4_sim.to_f) / ($perguntas_performance_level_1_sim + $perguntas_performance_level_1_nao + $perguntas_performance_level_2_sim + $perguntas_performance_level_2_nao + $perguntas_performance_level_3_sim + $perguntas_performance_level_3_nao + $perguntas_performance_level_4_sim + $perguntas_performance_level_4_nao.to_f).round(2)
		
	end

	def comparar_com_metas		
		calcular_execucao
		calcular_arquitetura
		calcular_gerenciamento		
		definir_cores_para_valores($valor_execucao, "Execução")
		definir_cores_para_valores($valor_arquitetura, "Arquitetura")
		definir_cores_para_valores($valor_gerenciamento, "Gerenciamento")
		definir_cores_para_performance
	end

	def definir_cores_para_valores(valor, grupo)
		if valor < 1.7
			then cor = "R"
		elsif valor < 1.9
			then cor = "Y"			
		else cor = "G"
		end
		
		case grupo
		when "Execução"
			$cor_execucao = cor
		when "Arquitetura"
			$cor_arquitetura = cor
		when "Gerenciamento"
			$cor_gerenciamento = cor
		end		
	end


	def definir_cores_para_performance
		if $porcentagem_performance == 1.0
			then $cor_performance = "G"
		else $cor_performance = "R"
		end
	end

	def calcular_execucao
		if $porcentagem_execucao[0] >= $meta_1
		then $valor_execucao = 1
		else $valor_execucao = $porcentagem_execucao[0] if $porcentagem_execucao[0].nan? == false
		end

		if $valor_execucao == 1 then
			if $porcentagem_execucao[1] >= $meta_2
			then $valor_execucao += 1
			else $valor_execucao += $porcentagem_execucao[1] if $porcentagem_execucao[1].nan? == false
			end
		end

		if $valor_execucao == 2 then
			if $porcentagem_execucao[2] >= $meta_3
			then $valor_execucao += 1
			else $valor_execucao += $porcentagem_execucao[2] if $porcentagem_execucao[2].nan? == false
			end
		end

		if $valor_execucao == 3 then
			if $porcentagem_execucao[3] >= $meta_4
			then $valor_execucao += 1
			else $valor_execucao += $porcentagem_execucao[3] if $porcentagem_execucao[3].nan? == false
			end
		end
	end

	def calcular_arquitetura
		if $porcentagem_arquitetura[0] >= $meta_1
		then $valor_arquitetura = 1
		else $valor_arquitetura = $porcentagem_arquitetura[0] if $porcentagem_arquitetura[0].nan? == false
		end

		if $valor_arquitetura == 1 then
			if $porcentagem_arquitetura[1] >= $meta_2
			then $valor_arquitetura += 1
			else $valor_arquitetura += $porcentagem_arquitetura[1] if $porcentagem_arquitetura[1].nan? == false
			end
		end

		if $valor_arquitetura == 2 then
			if $porcentagem_arquitetura[2] >= $meta_3
			then $valor_arquitetura += 1
			else $valor_arquitetura += $porcentagem_arquitetura[2] if $porcentagem_arquitetura[2].nan? == false
			end
		end

		if $valor_arquitetura == 3 then
			if $porcentagem_arquitetura[3] >= $meta_4
			then $valor_arquitetura += 1
			else $valor_arquitetura += $porcentagem_arquitetura[3] if $porcentagem_arquitetura[3].nan? == false
			end
		end
	end

	def calcular_gerenciamento
		if $porcentagem_gerenciamento[0] >= $meta_1
		then $valor_gerenciamento = 1
		else $valor_gerenciamento = $porcentagem_gerenciamento[0] if $porcentagem_gerenciamento[0].nan? == false
		end

		if $valor_gerenciamento == 1 then
			if $porcentagem_gerenciamento[1] >= $meta_2
			then $valor_gerenciamento += 1
			else $valor_gerenciamento += $porcentagem_gerenciamento[1] if $porcentagem_gerenciamento[1].nan? == false
			end
		end

		if $valor_gerenciamento == 2 then
			if $porcentagem_gerenciamento[2] >= $meta_3
			then $valor_gerenciamento += 1
			else $valor_gerenciamento += $porcentagem_gerenciamento[2] if $porcentagem_gerenciamento[2].nan? == false
			end
		end

		if $valor_gerenciamento == 3 then
			if $porcentagem_gerenciamento[3] >= $meta_4
			then $valor_gerenciamento += 1
			else $valor_gerenciamento += $porcentagem_gerenciamento[3] if $porcentagem_gerenciamento[3].nan? == false
			end
		end			
	end

	def printar_grupos
		puts "Arquitetura:"
		puts "Sim: " + "1- " + "#{$perguntas_arquitetura_level_1_sim}" + " | " + "2- " + "#{$perguntas_arquitetura_level_2_sim}" + " | " + "3- " + "#{$perguntas_arquitetura_level_3_sim}" + " | " + "4- " + "#{$perguntas_arquitetura_level_4_sim}"
		puts "Não: " + "1- " + "#{$perguntas_arquitetura_level_1_nao}" + " | " + "2- " + "#{$perguntas_arquitetura_level_2_nao}" + " | " + "3- " + "#{$perguntas_arquitetura_level_3_nao}" + " | " + "4- " + "#{$perguntas_arquitetura_level_4_nao}"
		puts "Valor: " + "#{$valor_arquitetura}"
		puts "COR: " + "#{$cor_arquitetura}"
		
		puts "Execução:"
		puts "Sim: " + "1- " + "#{$perguntas_execucao_level_1_sim}" + " | " + "2- " + "#{$perguntas_execucao_level_2_sim}" + " | " + "3- " + "#{$perguntas_execucao_level_3_sim}" + " | " + "4- " + "#{$perguntas_execucao_level_4_sim}"
		puts "Não: " + "1- " + "#{$perguntas_execucao_level_1_nao}" + " | " + "2- " + "#{$perguntas_execucao_level_2_nao}" + " | " + "3- " + "#{$perguntas_execucao_level_3_nao}" + " | " + "4- " + "#{$perguntas_execucao_level_4_nao}"
		puts "Valor: " + "#{$valor_execucao}"
		puts "COR: " + "#{$cor_execucao}"
		
		puts "Gerenciamento:"
		puts "Sim: " + "1- " + "#{$perguntas_gerenciamento_level_1_sim}" + " | " + "2- " + "#{$perguntas_gerenciamento_level_2_sim}" + " | " + "3- " + "#{$perguntas_gerenciamento_level_3_sim}" + " | " + "4- " + "#{$perguntas_gerenciamento_level_4_sim}"
		puts "Não: " + "1- " + "#{$perguntas_gerenciamento_level_1_nao}" + " | " + "2- " + "#{$perguntas_gerenciamento_level_2_nao}" + " | " + "3- " + "#{$perguntas_gerenciamento_level_3_nao}" + " | " + "4- " + "#{$perguntas_gerenciamento_level_4_nao}"
		puts "Valor: " + "#{$valor_gerenciamento}"
		puts "COR: " + "#{$cor_gerenciamento}"	

		puts "Performance:"
		puts "Sim: " + "1- " + "#{$perguntas_performance_level_1_sim}" + " | " + "2- " + "#{$perguntas_performance_level_2_sim}" + " | " + "3- " + "#{$perguntas_performance_level_3_sim}" + " | " + "4- " + "#{$perguntas_performance_level_4_sim}"
		puts "Não: " + "1- " + "#{$perguntas_performance_level_1_nao}" + " | " + "2- " + "#{$perguntas_performance_level_2_nao}" + " | " + "3- " + "#{$perguntas_performance_level_3_nao}" + " | " + "4- " + "#{$perguntas_performance_level_4_nao}"
		puts "Valor: " + "#{$porcentagem_performance}"		
		puts "COR: " + "#{$cor_performance}"
	end
end

World(ORM)