public class taskController {

    @AuraEnabled // getTasks function is now lightning-enabled
    public static List<Task> getTasks() {
        return [SELECT Id, Subject FROM Task];
    }
    
    @AuraEnabled
    public static Task saveTasks(Task theTask) {
        insert theTask;
        return theTask;
    }
}