#encoding: utf-8 
#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "table"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "wait_ajax"))

Dado(/^que (?:|eu) acesse o (.+)$/) do |page_name|
  i = 0
  while i < 1 do
  visit path_to(page_name)

 #PASSO 1
     #Nome do Espaço
     sleep(1)
     @virtualAddress = Faker::Lorem.characters(5) + 'ciandt'
     fill_in('virtualAddress', :with => @virtualAddress)
     find_button("Verificar").click
     find_button("Reservar").click
     wait_validation("virtualAddress")
     #CPF
     sleep(0.5)
     @cpf = Faker::CPF.numeric
     find("input[id=document1]").click
     fill_in('document1', :with => @cpf)
     wait_validation("document1")
     #Data de Nascimento
     sleep(0.5)
     find("input[id=birthday]").click
     fill_in('birthday', :with => "10/08/1980")
     wait_validation("birthday")
     #Nome da CND
     find("input[id=name]").click
     fill_in('name', :with => "Automacao")
     wait_validation("name")
     #Sobrenome da CND
     find("input[id=lastname]").click
     fill_in('lastname', :with => "CIT")
     wait_validation("lastname")
     #Email da CND
     @email = "#{@virtualAddress}#{i}@ciandt.com"
     find("input[id=email]").click
     fill_in('email', :with => @email)
     wait_validation("email")
     #Confirmar Email
     find("input[id=confirmEmail]").click
     fill_in('confirmEmail', :with => @email)
     page.execute_script("$('input[id=confirmEmail]').blur()")
     wait_validation("confirmEmail")
     #Senha
     find("input[id=password]").click
     fill_in('password', :with => "inicial1")
     wait_validation("password")
     #Confirmar Senha
     find("input[id=confirmPassword]").click
     fill_in('confirmPassword', :with => "inicial1")
     page.execute_script("$('input[id=confirmPassword]').blur()")
     wait_validation("confirmPassword")
     #Celular
     find("input[id=cellphone]").click
     fill_in('cellphone', :with => "19991919191")
     wait_validation("cellphone")
     #Gênero
     find_button("Gênero").click
     find("a[data-bind=M]").click
     #RG
     find("input[id=rg]").click
     fill_in('rg', :with => "323232")
     #CEP
     find("input[id=cep]").click
     fill_in('cep', :with => "13460000")
     #Número
     find("input[id=addressNumber]").click
     fill_in('addressNumber', :with => "111")
     #Bairro
     find("input[id=addressNeighborhood]").click
     fill_in('addressNeighborhood', :with => "Bairro")
     #Rua
     find("input[id=street]").click
     fill_in('street', :with => "Rua")
     #Estado
     if find("button[id=addressRegion]").disabled? == false then
      find("button[id=addressRegion]").click
      find("a[data-bind=SP]").click
     end
     #Cidade
     if find("input[id=addressCity]").disabled? == false then
      find("input[id=addressCity]").click
      fill_in('addressCity', :with => "Campinas")
     end    
     #Contrato de Franquia
     find_by_id('fContratoFranquia').find("label").click
     #Termos de uso
     find_by_id('fTermosUso').find("label").click
     #Salvar
     click_button("Avançar")
     wait_for_ajax

#----------------------------------------------------------------------------------------#

 #PASSO 2

     #Nome do Cartão
     wait_for_page
     find("input[id=creditcardnameholder]").click
     fill_in('creditcardnameholder', :with => "TESTE CIT")
     #Número do Cartão
     find("input[id=creditcardnumber]").click
     fill_in('creditcardnumber', :with => "4444555566667779")
     #Mês validade
     find_button("Mês").click
     find("a[data-bind='12']").click
     #Ano validade
     find_button("Ano").click
     find("a[data-bind='2020']").click
     #Contrato Moip
     find_by_id('fCheckDoc').find("label").click
     binding.pry
     click_button("Finalizar Cadastro")

#----------------------------------------------------------------------------------------#

 #FINALIZAÇÃO
     expect(page).to have_content(@email) 
     #Log das CNDs cadastradas
       arq = File.new("arquivo.txt", "a+")
       arq.puts ("#{i}"+ " - " + "#{@virtualAddress}" + " - "+ "#{@email}" + " - " + "#{@cpf}")
       arq.close
     i +=1
  end    
end