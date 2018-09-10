({
	handleCreateTask : function(component, event, helper) {
        const inputValue = document.getElementById('task-input').value;
        
        if (inputValue) {
            // Get all tasks as an array, and include the new one
            let tasks = component.get('v.taskList');
            if(!tasks.includes(inputValue)) {
                tasks.push(inputValue);
            } else {
                alert('This task already exists. Please use a different name.');
            }
            
            // Save tasks
            component.set('v.taskList', tasks);
        } else {
            alert('Please insert a task.');
        }
	}
})