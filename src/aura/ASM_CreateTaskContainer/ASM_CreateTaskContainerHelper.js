({
	addTasks : function(component, todoTask) {
                // Getting the Apex function, defining the parameters
                var action = component.get("c.addTask") 
                action.setParams({
                        theTask: {
                                'sObjectType':'Task',
                                'Subject':todoTask,
                                'Status':'Not Started',
                                'Priority':'Normal'
                            }
                })

                $A.enqueueAction(action)
        
                alert('Task Added Successfully');
	}
})