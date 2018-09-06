({
	updateTasks : function(component, todoTask) {
        this.saveTasks(component, todoTask, function(response) {
            const state = response.getState();
            if (state === 'SUCCESS') {
                var tasks = component.get('v.tasks');
                tasks.push(response.getReturnValue());
                component.set('v.tasks', tasks);
            } else {
                alert('Your code is messed up bro');
            }
            
        })
	}
})