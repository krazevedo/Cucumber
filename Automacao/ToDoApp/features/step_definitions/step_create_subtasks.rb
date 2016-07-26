#encoding: utf-8 
#!/usr/bin/env ruby

When(/^I click in Manage Subtasks$/) do
  @tasks.grid.subtasks_button.first.click
  @subtasks = SubTasksPage.new  
end

When(/^I fill Subtask Name and Due Date$/) do
  @subtask_name = Faker::StarWars.character + ' SubTask' 
  @due_date = Date.today.strftime('%m/%d/%Y')
  @subtasks.new_subtask.set(@subtask_name)
  @subtasks.due_date.set(@due_date)   
end

When(/^I click Add$/) do
  @subtasks.add_button.click  
end

Then(/^I should see my subtask on the list of created subtasks$/) do
  @names = @subtasks.grid.grid_subtask_name.collect(&:text)
  @subtasks.find_subtask_created(@subtask_name, @names) 
  click_button("Close")
end

Then(/^I should not see subtask on the list of created subtasks$/) do
  @names = @subtasks.grid.grid_subtask_name.collect(&:text)
  @subtasks.find_invalid_subtask_created(@subtask_name, @names)   
end

When(/^I fill Subtask Name with more than 250 characters$/) do 
  @subtask_name = Faker::Lorem.characters(251)
  @due_date = Date.today.strftime('%m/%d/%Y')
  @subtasks.new_subtask.set(@subtask_name)
  @subtasks.due_date.set(@due_date)   
end

When(/^I fill Subtask Name and Due Date in blank$/) do
  @subtask_name = ""
  @due_date = ""
  @subtasks.new_subtask.set(@subtask_name)
  @subtasks.due_date.set(@due_date)   
end

When(/^I fill Due Date with format invalid$/) do
  @subtask_name = Faker::StarWars.character + ' SubTask' 
  @due_date = "31/01/2016"
  @subtasks.new_subtask.set(@subtask_name)
  @subtasks.due_date.set(@due_date)   
end

Then(/^I should see field disable$/) do
 @task_disable = @subtasks.edit_task_name[:class].include? 'form-control[readonly]'
 raise "No class readonly or disable" if @task_disable == false
end

Then(/^I should see error message in SubTask Name$/) do
  @message_subtask = @subtasks.new_subtask[:class].include? 'ng-invalid'
  raise "No error message" if @message_subtask == false
end

Then(/^I should see error message in Due Date$/) do
 @message_due_date = @subtasks.due_date[:class].include? 'ng-invalid'
end

Then(/^I should see error message in SubTask Name and Due Date$/) do
 @message_subtask = @subtasks.new_subtask[:class].include? 'ng-invalid'   
 @message_due_date = @subtasks.due_date[:class].include? 'ng-invalid'
 raise "No error message" if @message_subtask == false or @message_due_date == false
end