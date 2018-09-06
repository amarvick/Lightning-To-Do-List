({
	fetchContacts : function(component, event, helper) {
		var action = component.get('c.getContacts'); // c = controller
        var accountId = component.get('v.recordId');
        
        action.setParams({
            accountIds: accountId
        });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            // state can be SUCCESS, ERROR, INCOMPLETE
            if (state === 'SUCCESS') {
                console.log('Response succeeded!')
                var contactList = response.getReturnValue();
                console.log(contactList);
            } else {
                alert('Error in getting data');
            }
        })
        
        $A.enqueueAction(action);
	}
})