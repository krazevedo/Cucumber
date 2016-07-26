#encoding: utf-8 
#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "table"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "wait_ajax"))

Dado(/^que (?:|eu) acesse a (.+)$/) do |page_name|
	visit path_to(page_name)
	for i in 2..5644 do
		resultado = Array.new
		if all("body > table > tbody > tr:nth-child(#{i}) > td").count > 3
			then for j in 3..17 do
				resultado += [find("body > table > tbody > tr:nth-child(#{i}) > td:nth-child(#{j})").text.to_i]
			end
		else next
		end	

 #Log das CNDs cadastradas
       arq = File.new("arquivo2.txt", "a+")
       arq.puts ("#{resultado.sort}")
       arq.close
     i +=1
    end
end