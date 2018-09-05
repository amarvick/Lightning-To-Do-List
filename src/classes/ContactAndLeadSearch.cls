public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String searchWord) {
        String searchQuery = 'FIND \'' + searchWord + '\' IN ALL FIELDS RETURNING Lead(Name, FirstName, LastName), Contact(FirstName, LastName)';
        List<List<SObject>> searchList = search.query(searchQuery);
        
        return searchList;
    }
}