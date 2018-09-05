({
    createItem: function(component, item) {
        this.saveItem(component, item, function(response) {
            var state = response.getState(); // shows whether or not this was successful
            if (state === 'SUCCESS') {
                var items = component.get('v.items');
                items.push(response.getReturnValue());
                component.set('v.items', items);
                component.set(item, { 'sobjectType': 'Camping_Item__c',
                                            'Name': '',
                                            'Price__c': 0, 
                                            'Quantity__c': 0,
                                            'Packed__c': false
                                    }
                )
            }
        })
    },

    updateItem: function(component, item) {
        this.saveItem(component, item);
    }
})