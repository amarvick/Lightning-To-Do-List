public class taskController {
    
    @AuraEnabled // getTasks function is now lightning-enabled. This should happen on page initialization
    public static List<String> getTasks() {
        User u = [Select Id FROM user where id = : Userinfo.getUserID()].get(0); // AM - initialize once.
        List<String> subjects = new List<String>();
        List<Task> allTasks = [SELECT Id, Subject FROM Task];
        
        for (Task t : allTasks) {
            subjects.add(t.Subject);
        }
        
        return subjects;
    }
    
    @AuraEnabled // AM - This is for saving tasks. Will need to improve code for deleting/adding
    public static void saveTasks(List<String> theTaskSubjects) {
        User u = [Select Id FROM user where id = : Userinfo.getUserID()].get(0); // AM - initialize once.
        
        // Tasks to Add
        List<Task> allNewTasks = new List<Task>();
        
        // Tasks to Remove
        List<Task> tasksToRemove = new List<Task>();
   
        // Current Tasks/Subjects
        List<String> allCurrentTaskSubjects = getTasks();
        List<Task> allCurrentTasks = [SELECT Id, Subject FROM Task WHERE Subject =: allCurrentTaskSubjects];
        
        // Map Subjects with Tasks
        Map<String, Task> getTaskFromString = new Map<String, Task>();
        for (Task t : allCurrentTasks) {
            if(allCurrentTaskSubjects.contains(t.Subject) && !getTaskFromString.containsKey(t.Subject)) {
                getTaskFromString.put(t.Subject, t);
            }
        }
        
        // Get Tasks to Remove
        for (String cs : allCurrentTaskSubjects) {
            if (!theTaskSubjects.contains(cs)) {
				tasksToRemove.add(getTaskFromString.get(cs));
            }
        }
        
        // Get Tasks to Add
        for (String s : theTaskSubjects) {
            if (!allCurrentTaskSubjects.contains(s)) {
            
                Task theNewTask = new Task(
                    Subject = s,
                    OwnerId = u.Id
                );
                System.debug('theNewTask: ' + theNewTask);
                allNewTasks.add(theNewTask);
            }
        }
        
        delete tasksToRemove;
    	insert allNewTasks;
    }
    
    @AuraEnabled // AM - May not use this
    public static void saveTasks(String theTaskSubject) {
        User u = [Select Id FROM user where id = : Userinfo.getUserID()].get(0); // AM - initialize once.

        Task theNewTask = new Task(
            Subject = theTaskSubject,
            OwnerId = u.Id
        );
        
        insert theNewTask;
    }
}