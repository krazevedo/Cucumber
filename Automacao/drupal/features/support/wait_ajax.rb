module WaitAjax

	def wait_for_ajax
	  counter = 0
	  while page.execute_script("return $.active").to_i > 0
	  	counter += 1
	    sleep(0.1)
	    raise "AJAX request took longer than 5 seconds." if counter >= 50
	  end
	end

	def wait_for_button
	  counter = 0
	  teste = page.has_button?("Remover")
	  while teste == false
	  	counter += 1
	   	teste = has_button?("Remover")
	    sleep(0.1)
	    raise "Button doesn't visible than 5 seconds." if counter >= 50	    
	  end
	end

end

World(WaitAjax)