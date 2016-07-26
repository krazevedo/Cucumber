module Login

	def validade_invalid_login(table)
		@login = LoginPage.new
		@login.load
		data =  retorna_tabela_hash(table)
	  	count = data['User'].size.to_i
  		count.times do | vnum |
  			@login.login(data['User'][vnum].to_s, data['Password'][vnum].to_s)
  			expect(@login.message_error.text).to eq data['Message'][vnum].to_s						
		end
	end
end

World(Login)