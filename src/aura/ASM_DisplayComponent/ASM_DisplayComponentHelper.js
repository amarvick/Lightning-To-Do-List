({
	updateTasks : function(component, allTasks) {
        
        // Getting the Apex function, defining the parameters
        var action = component.get("c.saveTasks") 
        action.setParams({theTaskSubjects: allTasks})
                          
        // Firing the Apex function
        $A.enqueueAction(action)
        
        alert('Saved');
	},
    
    retrieveTasks : function(component) {
        var allTasks = []
        var action = component.get("c.getTasks")
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === 'SUCCESS') {
                component.set('v.tasks', response.getReturnValue())
            } else {
                alert('State status: ' + state);
            }
        })
        
        $A.enqueueAction(action)
    }
})