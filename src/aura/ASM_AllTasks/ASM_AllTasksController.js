({
	doInit : function(component, event, helper) {
        var arrayIndex = component.get('v.arrayIndex') - 1;
        console.log('arrayIndex: ' + arrayIndex)
        
		var status = component.get('v.theTask.Status');
        console.log('status: '+ status);  
        
        var statusSelectMenu = document.getElementsByClassName('statusSelectMenu')[arrayIndex];
		statusSelectMenu.value = status;
        
		var priority = component.get('v.theTask.Priority');
        console.log('priority: '+ priority);     

        var prioritySelectMenu = document.getElementsByClassName('prioritySelectMenu')[arrayIndex];
		prioritySelectMenu.value = priority;

	},
    
    updateStatus : function(component, event, helper) {
        var arrayIndex = component.get('v.arrayIndex') - 1;
        var theTask = component.get('v.theTask');

        var statusSelectMenu = document.getElementsByClassName('statusSelectMenu')[arrayIndex];
        var newStatus = statusSelectMenu.options[statusSelectMenu.selectedIndex].value;
        
        component.set(theTask, {
            'sObjectType': 'Task',
            'Subject': theTask.Subject,
            'Status': newStatus,
            'Priority': theTask.Priority
        });
    },

    updatePriority : function(component, event, helper) {
        var arrayIndex = component.get('v.arrayIndex') - 1;
        var theTask = component.get('v.theTask');

        var prioritySelectMenu = document.getElementsByClassName('prioritySelectMenu')[arrayIndex];
        var newPriority = prioritySelectMenu.options[prioritySelectMenu.selectedIndex].value;
        
        component.set(theTask, {
            'sObjectType': 'Task',
            'Subject': theTask.Subject,
            'Status': theTask.Status,
            'Priority': newPriority
        });
    }
})