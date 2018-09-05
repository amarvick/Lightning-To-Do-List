public class RandomContactFactory {
    public static list<Contact> generateRandomContacts(integer totalContacts, string LastNameGenerate) {
        List<Contact> con = new List<Contact>();
        for(Integer i = 0; i < totalContacts; i++) {
            LastNameGenerate = 'Test' + i;
            Contact a = new Contact(FirstName = LastNameGenerate, LastName = LastNameGenerate);
            con.add(a);
        }
        return con;
    }
}