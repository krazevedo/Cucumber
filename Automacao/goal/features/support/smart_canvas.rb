module Smart_Canvas

	def logar_no_google
		click_button("Sign in with Google Apps")
		fill_in("Email", :with => "kaior@ciandt.com")
		click_button("Next")
		fill_in("Passwd", :with => "N3w_m3t4l85")
		click_button("Sign in")
	end

	def validar_card_criado
		find("h2", :text => $description)
		Capybara::Screenshot.screenshot_and_save_page
	end
end

World(Smart_Canvas)