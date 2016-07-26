module Wait

	def wait_for_graph
	  counter = 0	  
	  within("div#chartContainer") do	  	  
		  drill = page.has_css?("div#tableview tbody tr")
		  title = page.has_css?("#titleChart")
		  not_found = false
		  
		  while drill == false && not_found == false
		  	counter += 1
		  	not_found = page.has_css?("span#nodatawarning", :text => 'No data found.', :visible => true)
		  	title = page.has_css?("span#titleChart")		   	
		   	if not_found == false 
		   	then drill = page.has_css?("div#tableview tbody tr")			  		
		  	elsif title == false
		  		 not_found = false
		  	end
		   	raise "Graph doesn't visible." if counter >= 50	    
		  end		  	
	  end  
	  page.has_no_css?("div#loading", :visible => true)
	end

	def wait_for_cards
	  counter = 0
	  teste = page.has_selector?("div#cardsContainer div")
	  while teste == false
	  	counter += 1
	   	teste = has_selector?("div#cardsContainer div")
	    raise "Cards doesn't visible than 3 seconds." if counter >= 5	    
	  end
	end

	def wait_no_loading
		while page.has_css?("div#loading", :visible => true) == true
			sleep(0.5)
		end	
	end
end

World(Wait)