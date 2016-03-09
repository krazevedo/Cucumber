module Grid

	def clicar_no_apply
		click_button("Apply")
		has_selector?("table > tbody > tr")
	end

	def validar_valores_details(table)
		data =  retorna_tabela_hash(table)
	  	count = data['Submit Date'].size.to_i
  		count.times do | vnum |
  			grid = find("div#ormTable > div > table > tbody > tr")
			collums = grid.all("td")
			expect(collums[0].text).to eq data['Submit Date'][vnum].to_s
			expect(collums[1].text).to eq data['SSO'][vnum].to_s
			expect(collums[2].text).to eq data['Tower'][vnum].to_s
			expect(collums[3].text).to eq data['Contract'][vnum].to_s
			expect(collums[4].text).to eq data['Flow'][vnum].to_s
			expect(collums[5].text).to eq data['Flow Type'][vnum].to_s
			expect(collums[6].text).to eq data['Sr Mgmt'][vnum].to_s
			expect(collums[7].text).to eq data['Manager'][vnum].to_s
			expect(collums[8].text).to eq data['Operation Risk'][vnum].to_s
			expect(collums[9].text).to eq data['PML'][vnum].to_s
			expect(collums[10].text).to eq data['NQC (L3M)'][vnum].to_s
			expect(collums[11].text).to eq data['Architecture'][vnum].to_s
			expect(collums[12].text).to eq data['Execution'][vnum].to_s
			expect(collums[13].text).to eq data['Management'][vnum].to_s
			expect(collums[14].text).to eq data['Performance'][vnum].to_s
			expect(collums[15].text).to eq data['Client Satisfaction'][vnum].to_s
			expect(collums[16].text).to eq data['KPs & Team'][vnum].to_s			
			expect(collums[17].text).to eq data['Comments'][vnum].to_s
			
		end
	end

	def validar_quantidade_raw(data, vnum)
		has_no_css?("div#request-loading", :visible => true)
		has_table?("div#reportTable > div > table")
		sleep(2)
		expect(all("div#reportTable > div > table > tbody > tr").count.to_s).to eq data['esperado'][vnum].to_s
	end
end

World(Grid)