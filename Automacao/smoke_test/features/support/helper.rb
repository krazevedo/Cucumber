module Helper

	def grid_assert_screenshot(href, result)
		first(:href, href).click
		assert_screenshot(result)
    end

    def assert_screenshot(result)
		expect(page).to have_content(result) 
        Capybara::Screenshot.screenshot_and_save_page 
    end

    def date_to_datapicker(date)
    	find_by_id("start-date").click
        page.execute_script("$('#start-date').removeAttr('readonly')")
        fill_in('start-date', :with => date)
        click_button("btn-ok-datepicker")  
    end
end
    World(Helper)

