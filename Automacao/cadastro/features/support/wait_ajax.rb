module Wait

	def wait_for_ajax
	  counter = 0
	  while page.execute_script("return $.active").to_i > 0
	   	counter += 1
	    sleep(0.1)
	    raise "AJAX request took longer than 5 seconds." if counter >= 50
	  end
	end

	def wait_for_page
	  counter = 0
	  teste = has_selector?("input[id=creditcardnameholder]")
	  while teste == false
	  	counter += 1
	   	teste = has_selector?("input[id=creditcardnameholder]")
	    sleep(0.1)
	    raise "Selector doesn't visible than 5 seconds." if counter >= 50	    
	  end
	end

	def wait_validation(selector)
	  counter = 0
	  teste = has_css?("input[id=#{selector}].ng-valid")
	  while teste == false
	  	counter += 1
	  	page.execute_script("$('input[id=#{selector}]').blur()")
	   	teste = has_css?("input[id=#{selector}].ng-valid")
	    raise "Selector doesn't visible than 3 seconds." if counter >= 2	    
	  end
	end

end

World(Wait)