public class taskController {
    @AuraEnabled // getTasks function is now lightning-enabled
    public static List<Task> getTasks() {
        return null;
    }
    
    @AuraEnabled
    public static List<Task> saveTasks() {
        return null;
    }
}