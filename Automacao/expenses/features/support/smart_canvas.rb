module Smart_Canvas

	def logar_no_google
		find_by_id('signin-button').click
		main = page.driver.browser.window_handles.first
		popup = page.driver.browser.window_handles.last
		page.driver.browser.switch_to.window(popup)
		within("form#gaia_loginform") do		
			fill_in("Email", :with => ENV['user'])
			if has_css?('Passwd') == true
				then fill_in("Passwd", :with => ENV['passwd'])
			else
				click_button("Next")
				fill_in("Passwd", :with => ENV['passwd'])
			end
			click_button("Sign in")
		end		
		page.driver.browser.switch_to.window(main)		
	end

	def validar_card_criado
		has_selector?("div.sc-card-fixed-photo-text-container > div > h2")
		find("h2", :text => $description)
		Capybara::Screenshot.screenshot_and_save_page
	end
end

World(Smart_Canvas)