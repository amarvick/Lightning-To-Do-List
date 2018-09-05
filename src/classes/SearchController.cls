public class SearchController {
	private final Account account;
    
    public SearchController() {
        account = [SELECT Id, Name, Site FROM Account WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    }
    
    public Account getAccount() {
        return account;
    }
    
}