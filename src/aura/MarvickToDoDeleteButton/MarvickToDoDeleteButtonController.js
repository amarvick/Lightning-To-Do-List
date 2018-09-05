({
	handleClick : function(component, event, helper) {
		// Get Array Index
		const index = component.get('v.arrayIndex');
        
        // Dispatch an Event to delete proper task
        const deleteEvent = $A.get("e.c:MarvickAppToDoDeleteTaskEvent");
        deleteEvent.setParam("arrayIndex", index);
        deleteEvent.fire();
	}
})