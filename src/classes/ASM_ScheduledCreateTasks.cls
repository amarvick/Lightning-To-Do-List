global class ASM_ScheduledCreateTasks implements Schedulable, Database.Batchable<Sobject> {

    global void execute(SchedulableContext SC) {
        ASM_ScheduledCreateTasks batch = new ASM_ScheduledCreateTasks();
        Id batchId = Database.executeBatch(batch, 1);
    }

    global Database.QueryLocator start(Database.BatchableContext info) {
        Task t = new Task(Priority = 'Medium', Status = 'Not Started', Subject = 'Autocreated Task');
        insert t;
        return null;
    }

    global void execute(Database.BatchableContext BC, List<Task> scope) { }
    
    global void finish(Database.BatchableContext BC) { }
}