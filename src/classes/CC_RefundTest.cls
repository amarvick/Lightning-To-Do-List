@isTest
public class CC_RefundTest {
    public static testMethod void testCreateRefund() {
        Application__c app = new Application__c(Name = 'Test');
        insert(app);
    
        PageReference pageRef = new PageReference('/apex/CC_Refund');
        Test.setCurrentPage(pageRef);
    
        // Page URL Parameters included
        ApexPages.currentPage().getParameters().put('retUrl', app.Id);    
        ApexPages.currentPage().getParameters().put('id', app.Id); 
        
        CC_RefundController controller = new CC_RefundController(new ApexPages.StandardController(app));
        
        controller.appName = 'Test';
        controller.saveRefund();
        
    }
}