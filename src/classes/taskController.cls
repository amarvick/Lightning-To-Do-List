public class taskController {

    public static User currentUser;

    public taskController() {
        currentUser = [SELECT Id FROM user where Id =: Userinfo.getUserID()].get(0);
    }
    
    @AuraEnabled // Makes function lightning enabled
    public static List<Task> getTasks() {
        List<Task> allTasks = [SELECT Id, Subject, Status FROM Task];
        return allTasks;
    }
    
    @AuraEnabled
    public static void addTask(Task theTask) {
        insert theTask;
    }

    @AuraEnabled
    public static void saveTasks(List<Task> theTasks) {
        // Tasks to Add
        List<Task> allNewTasks = new List<Task>();
        
        // Tasks to Remove
        List<Task> tasksToRemove = new List<Task>();

        // Tasks to Update
        List<Task> tasksToUpdate = new List<Task>();
   
        // Current Tasks
        List<Task> allCurrentTasks = getTasks();
        
        // Removing tasks OR updating
        for (Task act : allCurrentTasks) {
            // Was the task removed
            if (!theTasks.contains(act)) {
                tasksToRemove.add(act);
                // allNewTasks.add(New Task(Priority = 'Medium', Subject = 'Call', Status = 'Not Started'));
            } else {
                // Otherwise check if the task was updated
                for (Task t : theTasks) {
                    System.debug('t.Id: ' + t.Id + ', act.Id: ' + act.Id);
                    System.debug('t.Subject: ' + t.Subject + ', act.Subject: ' + act.Subject);
                    System.debug('t.Status: ' + t.Status + ', act.Status: ' + act.Status);
                    if (t.Id == act.Id && (t.Subject != act.Subject || t.Status != act.Status)) {
                        tasksToUpdate.add(t);
                    }
                }
            }
        }

        // // Inserting new tasks
        // for (Task t : theTasks) {
        //     if (String.isBlank(String.valueOf(t.Id))) {
        //         Task newTask = new Task(
        //             Subject = t.Subject,
        //             Status = t.Status,
        //             Priority = t.Priority
        //         );
        //         allNewTasks.add(newTask);
        //     }
        // }
        
        // allNewTasks.add(New Task(Priority = 'Medium', Subject = 'Call', Status = 'Not Started'));

        delete tasksToRemove;
        update tasksToUpdate;
    	insert allNewTasks;
    }
}