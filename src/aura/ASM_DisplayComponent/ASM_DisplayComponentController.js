({
	handleDeleteTask : function(component, event, helper) {
        // Get List of Tasks
        const tasks = component.get('v.tasks');
        
        // Get Array Index
        const arrayIndex = event.getParam('arrayIndex');
        
        // Remove the proper one
       	tasks.splice(arrayIndex, 1);
        
        // Set the List of Tasks
        component.set('v.tasks', tasks);
	},
    
    updateTasks : function(component, event, helper) {
        const tasks = component.get('v.tasks');
    	helper.updateTasks(component, tasks);
	},
    
    retrieveTasks: function(component, event, helper) {
        helper.retrieveTasks(component);
	}
})