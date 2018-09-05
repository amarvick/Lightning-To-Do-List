public class AccountHandler {
    public static Account insertNewAccount(String acctName) {
        Account acct = new Account(Name=acctName);
      
        try {      
            insert(acct);
        } catch (DmlException e) {
            System.debug('DML Exception occured: ' + e.getMessage());
            return null;
        }
        
        return acct;
    }
}