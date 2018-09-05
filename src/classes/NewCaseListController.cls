public class NewCaseListController {
    private String sortOrder = 'Id';
    
    public List<Case> getNewCases() { //'List' is the return type.
        List<Case> results = Database.query(
        	'SELECT Id, CaseNumber, Status ' +
        	'FROM Case ' +
            'WHERE Status = \'New\''
        );
    	return results;
    }
}