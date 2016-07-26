Feature: Create Task
		 As a ToDo App user
		 I should be able to create a task
		 So I can manage my tasks

Scenario: Validate Message Displayed

	Given I access My Tasks
	Then I should see "​Hey Kaio Roberto de Azevedo, this is your todo list for today:" message

Scenario: Validate Menu My Tasks

	Given I access My Tasks
	Then I should see "​My Tasks" menu

Scenario: Validate Create task

	Given I access My Tasks
	When I fill Task Name
	And I click in Add button
	Then I should see my task on the list of created tasks

Scenario: Validate Create task with more than 250 characters

	Given I access My Tasks
	When I fill Task Name with more 250 characters
	And I click in Add button
	Then I should not see task on the list of created tasks

Scenario: Validate Create task with less than three characters

	Given I access My Tasks
	When I fill Task Name with less than three characters
	And I press ENTER
	Then I should not see task on the list of created tasks

Scenario: Validate Create task in blank

	Given I access My Tasks
	When I fill Task Name in blank
	And I click in Add button
	Then I should not see task on the list of created tasks

Scenario: Validate Create task in blank

	Given I access My Tasks
	When I fill Task Name in blank
	And I press ENTER
	Then I should see error message in Task Name