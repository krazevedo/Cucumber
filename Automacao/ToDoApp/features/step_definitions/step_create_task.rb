#encoding: utf-8 
#!/usr/bin/env ruby

Given(/^I access My Tasks$/) do
  visit path_to('ToDo App')
  @login = LoginPage.new
	@login.load
	@login.login("kaio.azevedo85@gmail.com", "12345678")
	@tasks = TasksPage.new
	@tasks.load
end

Then(/^I should see "([^"]*)" message$/) do |arg1|
 	expect(@tasks).to have_text(arg1)
end

Then(/^I should see "([^"]*)" menu$/) do |arg1|
  @home = HomePage.new
  expect(@home.menu.menu_left[1].text) == arg1
end

When(/^I fill Task Name$/) do
	@task_name = Faker::StarWars.character + ' Task' 
  @tasks.new_task.set(@task_name)
end

When(/^I click in Add button$/) do
  @tasks.add_button.click
end

Then(/^I should see my task on the list of created tasks$/) do
	@names = @tasks.grid.grid_task_name.collect(&:text)
  @tasks.find_task_created(@task_name, @names)  	
end

Then(/^I should not see task on the list of created tasks$/) do
  @names = @tasks.grid.grid_task_name.collect(&:text)
  @tasks.find_invalid_task_created(@task_name, @names)    
end

When(/^I fill Task Name with more 250 characters$/) do
  @task_name = Faker::Lorem.characters(251)
  @tasks.new_task.set(@task_name)
end

When(/^I fill Task Name with less than three characters$/) do
  @task_name = Faker::Lorem.characters(2)
  @tasks.new_task.set(@task_name)
end

When(/^I press ENTER$/) do
	@tasks.new_task.native.send_keys(:enter)
end

When(/^I fill Task Name in blank$/) do
  @task_name = ''
  @tasks.new_task.set(@task_name)
end

Then(/^I should see error message in Task Name$/) do
  @message_task = @tasks.new_task[:class].include? 'ng-invalid'
  raise "No error message" if @message_task == false
end