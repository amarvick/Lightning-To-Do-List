public class taskController {
    
    
    @AuraEnabled // getTasks function is now lightning-enabled. This should happen on page initialization. See commented line
    public static List<Task> getTasks() {
        User u = [Select Id FROM user where id = : Userinfo.getUserID()].get(0); // AM - initialize once.
        return [SELECT Id, Subject FROM Task WHERE OwnerId =: u.Id];
    }
    
    @AuraEnabled // AM - Change these to tasks
    public static void saveTasks(List<String> theTaskSubjects) {
        User u = [Select Id FROM user where id = : Userinfo.getUserID()].get(0); // AM - initialize once.
        List<Task> allTasks = new List<Task>();
        
        for (String s : theTaskSubjects) {
            Task theNewTask = new Task(
                Subject = s,
                OwnerId = u.Id
            );
            allTasks.add(theNewTask);
        }
        
        insert allTasks;
    }
}