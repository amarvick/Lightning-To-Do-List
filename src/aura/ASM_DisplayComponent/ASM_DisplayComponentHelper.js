({
	updateTasks : function(component, allTasks) {
        
        // Getting the Apex function, defining the parameters
        var action = component.get("c.saveTasks") 
        action.setParams({theAccountNames: allTasks})
                          
        // Firing the Apex function
        $A.enqueueAction(action)
	}
})