public class taskController {

    public static User currentUser;

    public taskController() {
        currentUser = [SELECT Id FROM user where Id =: Userinfo.getUserID()].get(0);
    }
    
    @AuraEnabled // getTasks function is now lightning-enabled. This should happen on page initialization
    public static List<Task> getTasks() {
        List<String> subjects = new List<String>();
        List<Task> allTasks = [SELECT Id, Subject, Status FROM Task];
        
        for (Task t : allTasks) {
            subjects.add(t.Subject);
        }
        
        return allTasks;
    }
    
    @AuraEnabled // AM - This is for saving tasks. Will need to improve code for deleting/adding
    public static void saveTasks(List<String> theTaskSubjects, List<String> theTaskStatuses) {

        // // Tasks to Add
        // List<Task> allNewTasks = new List<Task>();
        
        // // Tasks to Remove
        // List<Task> tasksToRemove = new List<Task>();
   
        // // Current Tasks/Subjects
        // List<String> allCurrentTaskSubjects = getTasks();
        // List<Task> allCurrentTasks = [SELECT Id, Subject FROM Task WHERE Subject =: allCurrentTaskSubjects];
        
        // // Map Subjects with Tasks
        // Map<String, Task> getTaskFromString = new Map<String, Task>();
        // for (Task t : allCurrentTasks) {
        //     if(allCurrentTaskSubjects.contains(t.Subject) && !getTaskFromString.containsKey(t.Subject)) {
        //         getTaskFromString.put(t.Subject, t);
        //     }
        // }
        
        // // Get Tasks to Remove
        // for (String cs : allCurrentTaskSubjects) {
        //     if (!theTaskSubjects.contains(cs)) {
		// 		tasksToRemove.add(getTaskFromString.get(cs));
        //     }
        // }
        
        // // Get Tasks to Add
        // for (String s : theTaskSubjects) {
        //     if (!allCurrentTaskSubjects.contains(s)) {
            
        //         Task theNewTask = new Task(
        //             Subject = s
        //             // OwnerId = currentUser.Id
        //         );
        //         allNewTasks.add(theNewTask);
        //     }
        // }
        
        // delete tasksToRemove;
    	// insert allNewTasks;
    }

    @AuraEnabled // AM to do - get values from Task Status
    public static List<String> getTaskStatusValues() {
        List<String> statusValues = new List<String>();
        return statusValues;
    }
}