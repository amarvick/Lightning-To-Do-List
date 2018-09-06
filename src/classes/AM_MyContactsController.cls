public class AM_MyContactsController {
	@AuraEnabled
    public static List<Contact> getContacts(List<Id> accountIds) {
        List<Contact> contactList = [SELECT Id, Name, AccountId, Phone, Email FROM Contact WHERE AccountId =: accountIds];
    	return contactList;
    }
}