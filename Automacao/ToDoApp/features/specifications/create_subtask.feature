Feature: Create SubTask
		 As a ToDo App user
		 I should be able to create a subtask
		 So I can break down my tasks in smaller pieces

Scenario: Validate Create Subtask

	Given I access My Tasks
	When I click in Manage Subtasks
	And I fill Subtask Name and Due Date
	And I click Add
	Then I should see my subtask on the list of created subtasks

Scenario: Validate Create Subtask with more than 250 characters

	Given I access My Tasks
	When I click in Manage Subtasks
	And I fill Subtask Name with more than 250 characters
	And I click Add 
	Then I should not see subtask on the list of created 

Scenario: Validate Create Subtask with key ENTER

	Given I access My Tasks
	And I fill Subtask Name and Due Date
	And I press ENTER
	Then I should not see subtask on the list of created 

Scenario: Validate Create Subtask in blank

	Given I access My Tasks
	When I click in Manage Subtasks
	When I fill Subtask Name and Due Date in blank
	And I click Add
	Then I should not see subtask on the list of created 

Scenario: Validate Create Subtask with Date format invalid

	Given I access My Tasks
	When I click in Manage Subtasks
	And I fill Due Date with format invalid
	And I click Add
	Then I should not see subtask on the list of created 

Scenario: Validate Task Name disable

	Given I access My Tasks
	When I click in Manage Subtasks
	Then I should see field disable