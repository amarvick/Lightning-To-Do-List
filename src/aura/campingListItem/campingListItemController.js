({
    packItem : function(component, event, helper) {
        const packed = component.get('v.item')
        packed.set('v.item.Packed__c', true)

        const btnClicked = event.getSource() // This will get whatever is firing the action
        const btnDisabled = btnClicked.get('v.disabled');
        btnDisabled.set(btnDisabled, 'true') 
    }
})