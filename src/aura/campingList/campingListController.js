({
    doInit: function(component, event, helper) {
        var action = component.get('c.getItems'); /* Do this */
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === 'SUCCESS') {
                component.set('v.campingList', response.getReturnValue());
            } else {
                console.log('ERROR: ' + state);
            }
        });

        $A.enqueueAction(action);
    },

    clickCreateItem: function(component, event, helper) {
        const formIsGood = component.find('campingList').reduce(function(isValid, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return formIsGood && inputCmp.get('v.validity').valid;
        }, true);

        if (formIsGood) {
            var newCampingItem = component.get('v.newItem');
            helper.createItem(component, newCampingItem);
        }
    },

    handleAddItem: function(component, event, helper) {
        var newCampingItem = event.getParam('item');
        helper.createItem(component, newCampingItem);
    },

    // get Item, pass it in event and set the parameters for the new item
    addItem: function(component, event, helper) {
        var item = component.get('v.newItem');
        var updateEvent = component.getEvent('addItemEvent');
        updateEvent.setParams({'newItem': newItem});
        updateEvent.fire();
    },

    // Saves item. Refers to Apex Controller
    saveItem: function(component, item, callback) {
        var action = component.get('c.saveItem');
        
        action.setParams({
            'item': item
        });
        
        if (callback) {
            action.setCallback(this, callback);
        }
        
        $A.enqueueAction(action);
    }
})