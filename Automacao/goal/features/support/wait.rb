module Wait

	def wait_for_graph
	  counter = 0	  
	  within("div#chartContainer") do	  	  
		  drill = page.has_css?("div#tableview tbody tr")
		  not_found = false
		  while drill == false && not_found == false
		  	counter += 1
		  	not_found = page.has_css?("span#nodatawarning", :text => 'No data found.', :visible => true)		   	
		   	if not_found == false then
		  		drill = page.has_css?("div#tableview tbody tr")	
		  	end
		   	raise "Graph doesn't visible." if counter >= 30	    
		  end		  	
	  end  
	  page.has_no_css?("div#request-loading", :visible => true)
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
end

World(Wait)