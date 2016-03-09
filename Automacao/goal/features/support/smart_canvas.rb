module Smart_Canvas

	def logar_no_google
		binding.pry
		find("a", :text => "Sign In").click
		popup = page.driver.browser.window_handles.last
		page.driver.browser.switch_to.window(popup)
		within("form#gaia_loginform") do		
			fill_in("Email", :with => ENV["user_sc"])
			click_button("Next")
			has_selector?("Passwd")
			fill_in("Passwd", :with => ENV["passwd_sc"])
			click_button("Sign in")
		end
		click_button("Permitir")
	end

	def validar_card_criado
		has_selector?("div.sc-card-fixed-photo-text-container > div > h2")
		find("h2", :text => $description)
		Capybara::Screenshot.screenshot_and_save_page
	end
end

World(Smart_Canvas)