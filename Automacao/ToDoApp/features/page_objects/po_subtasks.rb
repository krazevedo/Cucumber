
class GridSection < SitePrism::Section
	element :remove_button, "td button.btn-danger"
	elements :grid_subtask_name, "tr td a.editable-click"
	element :edit_task_name, "form div input.editable-input"
	element :edit_submmit, "form div span.editable-buttons button.btn-primary"
	element :edit_cancel, "form div span.editable-buttons button.btn-default"
end

class SubTasksPage < SitePrism::Page
	element :edit_task_name, "textarea" 		
	element :new_subtask, "input#new_sub_task"
	element :due_date, "input#dueDate"
	element :add_button, "button#add-subtask"
	element :edit_subtask_name, "tr a.editable-click"  
	section :grid, GridSection, "div:nth-child(4) > table > tbody" 
	
	def find_subtask_created(subtask_name, names)
		sleep(1)
		for i in 0..names.count-1
		  if names[i] == subtask_name  
		  then created = true 
		  break
		  else created = false
		  end  
    end
	 raise "SubTask didn't found" if created == false		
	end	

  def find_invalid_subtask_created(subtask_name, names)
    if subtask_name == ""
      then subtask_name = "empty"
    end
    sleep(1)
    for i in 0..names.count-1
      if names[i] == subtask_name  
      then created = true 
      break
      else created = false
      end  
    end
   raise "Invalid subtask created" if created == true 
  end
end