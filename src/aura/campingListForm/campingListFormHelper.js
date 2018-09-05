({
	createItem: function(component, campingItem) {
        var theCampingItems = component.get('v.items');

        var newCampingItem = JSON.parse(JSON.stringify(campingItem));

        theCampingItems.push(newCampingItem);
        component.set('v.items', theCampingItems); // SIMILAR TO 'setState' in React!
    }
})