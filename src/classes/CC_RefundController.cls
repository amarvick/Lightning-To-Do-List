public class CC_RefundController{
    private ApexPages.StandardController sc;

    public Application__c app   {get; set;}
    public String appId         {get; set;}
    public String appName       {get; set;}

    public CC_RefundController(ApexPages.StandardController stdController) {
        sc = stdController;
        appId = ApexPages.CurrentPage().getParameters().get('id');
        app = [SELECT id, name, account__r.name FROM Application__c WHERE id = :appId];
    }
 
    public PageReference saveRefund() {
        try{
            app.Name = appName;
            update app;
        }
        catch(Exception ex){
            ApexPages.addMessages(ex);
        }
        return retURLFunction();
    }

    public PageReference retURLFunction(){
        String retURL = ApexPages.currentPage().getParameters().get('retURL');
        PageReference pageRef = new PageReference(retURL);  
        pageRef.setRedirect(true);               
        return pageRef;
    }
}