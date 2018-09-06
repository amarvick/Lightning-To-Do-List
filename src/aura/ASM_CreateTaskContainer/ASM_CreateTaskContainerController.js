({
	handleCreateTask : function(component, event, helper) {
        const inputValue = document.getElementById('task-input').value;
        
        // Get all tasks as an array, and include the new one
        let tasks = component.get('v.taskList');
        tasks.push(inputValue);
        
        // Save tasks
        component.set('v.taskList', tasks); 
	}
})