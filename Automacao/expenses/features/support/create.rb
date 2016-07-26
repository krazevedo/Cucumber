module Create

	def preencher_campos(type, city, currency, value, comment, tag, people, image)
		if has_css?('md-select', :text => 'Expense Type') == true
			then find('md-select', :text => 'Expense Type').click
			else find('div > md-input-container', :text => 'Expense Type').find(:xpath, '..').find('md-select').click
		end
		find('md-option > div.md-text.ng-binding', :text => type).click
		sleep(0.5)
		find('div.md-datepicker-input-container > input').set(Date.today.strftime('%m/%d/%Y'))
		if has_css?('md-select', :text => 'Expense City') == true
			then find('md-select', :text => 'Expense City').click
			else find('div > md-input-container', :text => 'Expense City').find(:xpath, '..').find('md-select').click
		end		
		find('md-option > div.md-text.ng-binding', :text => city).click
		if type != 'Mileage Reimbursement'
		then
			if has_css?('md-select', :text => 'Currency') == true
				then find('md-select', :text => 'Currency').click
				else find('div > md-input-container', :text => 'Currency').find(:xpath, '..').find('md-select').click
			end	
		 	find('md-option > div.md-text.ng-binding', :text => currency).click
		end
		find('div:nth-child(4) > div:nth-child(2) > md-input-container > input').set(value)
		find('div > div > md-input-container > textarea').set(comment)
		
		if image == true
			then find('input#uploadFile', :visible => false).set('/home/likewise-open/CIT/kaior/Downloads/cupom_fiscal.jpg')
		end
		
		if type == 'Meal (Team - In Site)' or type == 'Meal (Team - Off Site)'
			then
			if people != ''
				then 
				fill_in('Logins', :with => 'kaior')
				find('ul > li > md-autocomplete-parent-scope > div > span.md-contact-name > span').click
				find('div:nth-child(7) > md-input-container > md-content > md-chips > md-chips-wrap > div > input').set(tag)
			end
		else
			find('div:nth-child(6) > md-input-container > md-content > md-chips > md-chips-wrap > div > input').set(tag)
		end	
		
		click_button('Save')				
	end

	def validar_mensagens(type)
		while has_css?('body#app > md-toast > div > span') == false
			sleep(0.1) 
		end
		case type
			when 'Books'
				expect(find('body#app > md-toast > div').text).to eq ('Please upload an image or pdf.')
			when 'Meal (Team - In Site)' 
				expect(find('body#app > md-toast > div').text).to eq ('People is required.')
			when 'Mileage Reimbursement' 
				expect(find('body#app > md-toast > div').text).to eq ('Comment is required.')
			when 'Taxi'
				if has_no_selector?('md-card > md-card-title-media > div > a:nth-child(1) > div') == true
					then expect(find('body#app > md-toast > div').text).to eq ('Please upload an image or pdf.')
						 find('input#uploadFile', :visible => false).set('/home/likewise-open/CIT/kaior/Downloads/Is172086.jpg')
						 click_button('Create')	
						 sleep(5)
						 validar_mensagens(type)
				else expect(find('body#app > md-toast > div').text).to eq ('Comment is required.')
				end
		end
	end	
end

World(Create)