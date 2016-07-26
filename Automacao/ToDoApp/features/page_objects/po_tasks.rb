
class GridSection < SitePrism::Section
	elements :subtasks_button, "td button.btn-primary" 		
	element :remove_button, "td button.btn-danger"
	elements :grid_task_name, "tr td a.editable-click"
	element :edit_task_name, "form div input.editable-input"
	element :edit_submmit, "form div span.editable-buttons button.btn-primary"
	element :edit_cancel, "form div span.editable-buttons button.btn-default"
end

class TasksPage < SitePrism::Page
	set_url "#{$BASE_URL}/tasks"	
	element :new_task,  "input#new_task" 
	element :add_button, "span.input-group-addon" 
	element :title, "h1" 
	section :grid, GridSection, "div.panel-default > table > tbody" 

	def find_task_created(task_name, names)
		for i in 0..names.count-1
  		if names[i] == task_name  
  		then created = true 
  		break
  		else created = false
  		end  
    end
	 raise "Task didn't found" if created == false	
	end

  def find_invalid_task_created(task_name, names)
    if task_name == ""
      then task_name = "empty"
    end
    
    for i in 0..names.count-1
      if names[i] == task_name  
      then created = true 
      break
      else created = false
      end  
    end
   raise "Invalid task created" if created == true 
  end
end
