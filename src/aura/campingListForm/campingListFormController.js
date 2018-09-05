({    
    clickCreateItem: function(component, event, helper) {
        const formIsGood = component.find('campingListForm').reduce(function(isValid) {
            return true;
        })

        if (formIsGood) {
            var newCampingItem = component.get('v.newItem');
            createItem(component, newCampingItem);
        }
    },
    
    createItem: function(component, campingItem) {
        var theCampingItems = component.get('v.items');

        var theNewCampingItem = JSON.parse(JSON.stringify(newCampingItem));

        theCampingItems.push(theNewCampingItem);
        component.set('v.items', theCampingItems); // SIMILAR TO 'setState' in React!
        component.set('v.newItem', { 'sobjectType': 'Camping_Item__c',
                                     'Name': '',
                                     'Price__c': 0, 
                                     'Quantity__c': 0,
                                     'Packed__c': false
                                   }); // SIMILAR TO 'setState' in React!

    }

})