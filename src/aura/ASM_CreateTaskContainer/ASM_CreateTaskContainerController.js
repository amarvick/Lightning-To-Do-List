({
	handleCreateTask : function(component, event, helper) {
        const inputValue = document.getElementById('task-input').value;
        
        if (inputValue) {
            // Get all tasks as an array, and add the new one
            helper.addTasks(component, inputValue);

            let tasks = component.get('v.allTasks');
            tasks.push({
                'sObjectType':'Task',
                'Subject':inputValue,
                'Status':'Not Started',
                'Priority':'Normal'
            })
            
            // Save tasks
            component.set('v.allTasks', tasks);
        } else {
            alert('Please insert a task.');
        }
	}
})