({
	doInit : function(component, event, helper) {
        var arrayIndex = component.get('v.arrayIndex') - 1;
        console.log('arrayIndex: ' + arrayIndex)
        
		var status = component.get('v.taskStatus');
        console.log('status: '+ status);        

        var selectMenu = document.getElementsByClassName('statusSelectMenu')[arrayIndex];
		selectMenu.value = status;
        console.log('selectMenu.value: '+ selectMenu.value);
	}
})