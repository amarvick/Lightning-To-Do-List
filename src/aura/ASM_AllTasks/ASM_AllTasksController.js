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

	}
})