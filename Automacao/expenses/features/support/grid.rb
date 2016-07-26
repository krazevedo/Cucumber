module Grid

	def clicar_no_apply
		click_button("Apply")
		has_selector?("table > tbody > tr")
	end

	def clicar_add
		i = 0
		while find('body#app > div.container.ng-scope > div > button').visible? == false and i < 10
			print i
			sleep(1) 
			i += 1
		end	
		sleep(1)
		page.execute_script("$('body#app > div.container.ng-scope > div > button')[0].scrollIntoView(true);")	
		find('body#app > div.container.ng-scope > div > button').click
	end

	def validar_refund_criado(type, city, value, comment, image)
		i = 0
		while has_css?('body#app > div#toast-container > div > div > div.toast-message') == false and i < 10
			sleep(0.1) 
			i += 1
		end
		sleep(1)
		refunds = Array.new()
		refunds = first('tr > td:nth-child(5)', :text => city).find(:xpath, '..').all('td')
		expect(type.split(" ")[0]).to eq (refunds[1].text.split(" ")[0])
		expect(Date.today.strftime('%m/%d/%Y')).to eq (refunds[3].text)
		expect(city).to eq (refunds[4].text)
		setar_limite(type, value)
		expect("BRL " + "#{@actual_value}" + ".00").to eq (refunds[6].text)
		
		if type != 'Mileage Reimbursement'
			then expect("BRL " + "#{value}" + ".00").to eq (refunds[5].text)
		else expect(value + ".00").to eq (refunds[5].text)
		end

		if image == true
			then expect('attach_file').to eq (refunds[7].text)
		else expect('').to eq (refunds[7].text)
		end
		
		if comment != ''
			then expect('md-cell md-clickable').to eq (refunds[8][:class])
		else expect('md-cell md-clickable md-placeholder').to eq (refunds[8][:class])
		end
	end

	def setar_limite(type, value)
		case type
			when 'Hotel / Accommodations'
				@actual_value = 10
				if value < @actual_value
					then @actual_value = value
				end
			when 'Internet'
				@actual_value = 15
				if value < @actual_value
					then @actual_value = value
				end
			when 'Meal (Team - In Site)'
				@actual_value = 27
				if value < @actual_value
					then @actual_value = value
				end
			when 'Meal: Breakfast/Snack/Lunch Complem. (off site)'
				@actual_value = 30
				if value < @actual_value
					then @actual_value = value
				end
			when 'Taxi'
				@actual_value = 40
				if value < @actual_value
					then @actual_value = value
				end
			when 'Books'
				@actual_value = 100
				if value < @actual_value
					then @actual_value = value
				end
			when 'Mileage Reimbursement'
				@actual_value = (value.to_i * 0.55).to_i
		end
	end

	def selecionar_refund
		sleep(8)
		first('tr > td:nth-child(1)').click
	end

	def pegar_valores_grid_sent
		@refund_sent = Array.new()
		@refund_sent = all('tr:nth-child(1) > td').collect(&:text)
	end

	def pegar_valores_grid_pending
		@refund_pending = Array.new()
		@refund_pending = first('tr > td:nth-child(7)', :text => @voucher).find(:xpath, '..').	all('td').collect(&:text)
	end

	def pegar_valor_selecionado
		@valor_selecionado = find('div > div:nth-child(2) > div > p.ng-binding > span').text.split(": ")[1]
	end

	def selecionar_budget(budget, clob)
		find('form > md-input-container:nth-child(2) > md-select').click
		find('md-option > div.md-text.ng-binding', :text => budget).click	
		find('form > md-input-container:nth-child(3) > md-select').click
		find('md-option > div.md-text.ng-binding', :text => clob).click
	end

	def comparar_valores
		expect(@refund_sent[6]).to eq (@valor_selecionado)
	end

	def enviar_refund
		click_button("SEND")
		i = 0
		while has_css?('body#app > div.toast-container > div > div > div.toast-message') == false and i < 10
			sleep(0.1) 
			i += 1
		end
		@voucher = find('md-content > div > div > div.voucher > p').text
		click_button('OK')
	end

	def selecionar_aba(aba)
		case aba
			when "SENT"
				page.execute_script("$('md-tabs-canvas > md-pagination-wrapper > md-tab-item:nth-child(1) > span').click()")
			when "PENDING"				
				page.execute_script("$('md-tabs-canvas > md-pagination-wrapper > md-tab-item:nth-child(2) > span').click()")
			when "PAID"
				page.execute_script("$('md-tabs-canvas > md-pagination-wrapper > md-tab-item:nth-child(3) > span').click()")
		end
	end

	def validar_refund_enviado
		expect(@refund_sent[1]).to eq (@refund_pending[0])
		expect(@refund_sent[2]).to eq (@refund_pending[1])
		expect(Date.today.strftime('%m/%d/%Y')).to eq (@refund_pending[2])
		expect(@refund_sent[4]).to eq (@refund_pending[3])
		expect(@refund_sent[5]).to eq (@refund_pending[4])
		expect(@refund_sent[6]).to eq (@refund_pending[5])
		expect(@voucher).to eq (@refund_pending[6])
		expect(@refund_sent[7]).to eq (@refund_pending[7])		
	end

	# def validar_valores_details(table)
	# 	data =  retorna_tabela_hash(table)
	#   	count = data['Submit Date'].size.to_i
 #  		count.times do | vnum |
 #  			grid = find("div#ormTable > div > table > tbody > tr")
	# 		collums = grid.all("td")
	# 		expect(collums[0].text).to eq data['Submit Date'][vnum].to_s
	# 		expect(collums[1].text).to eq data['SSO'][vnum].to_s
	# 		expect(collums[2].text).to eq data['Tower'][vnum].to_s
	# 		expect(collums[3].text).to eq data['Contract'][vnum].to_s
	# 		expect(collums[4].text).to eq data['Flow'][vnum].to_s
	# 		expect(collums[5].text).to eq data['Flow Type'][vnum].to_s
	# 		expect(collums[6].text).to eq data['Sr Mgmt'][vnum].to_s
	# 		expect(collums[7].text).to eq data['Manager'][vnum].to_s
	# 		expect(collums[8].text).to eq data['Operation Risk'][vnum].to_s
	# 		expect(collums[9].text).to eq data['PML'][vnum].to_s
	# 		expect(collums[10].text).to eq data['NQC (L3M)'][vnum].to_s
	# 		expect(collums[11].text).to eq data['Architecture'][vnum].to_s
	# 		expect(collums[12].text).to eq data['Execution'][vnum].to_s
	# 		expect(collums[13].text).to eq data['Management'][vnum].to_s
	# 		expect(collums[14].text).to eq data['Performance'][vnum].to_s
	# 		expect(collums[15].text).to eq data['Client Satisfaction'][vnum].to_s
	# 		expect(collums[16].text).to eq data['KPs & Team'][vnum].to_s			
	# 		expect(collums[17].text).to eq data['Comments'][vnum].to_s
			
	# 	end
	# end

	# def validar_quantidade_raw(data, vnum)
	# 	has_no_css?("div#request-loading", :visible => true)
	# 	has_table?("div#reportTable > div > table")
	# 	sleep(2)
	# 	expect(all("div#reportTable > div > table > tbody > tr").count.to_s).to eq data['esperado'][vnum].to_s
	# end
end

World(Grid)