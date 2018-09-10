global class ASM_ScheduledRemoveTasks implements Schedulable, Database.Batchable<Sobject> {

    global void execute(SchedulableContext SC) {
        ASM_ScheduledRemoveTasks batch = new ASM_ScheduledRemoveTasks ();
        Id batchId = Database.executeBatch(batch, 100);
    }

    global Database.QueryLocator start(Database.BatchableContext info) {

        // Retrieving Custom Setting - Amount of days old a task has to be before getting removed
        ASM_Settings__c asmSettings = ASM_Settings__c.getOrgDefaults();
        DateTime daysAfterDeletion = DateTime.now().addDays(-(Integer.valueof(asmSettings.Age_Over_Days_Task_Deletion__c)));

        String query = 'SELECT ' +
                           'Id ' +
                       'FROM ' +
                           'Task ' +
                       'WHERE ' +
                           'Status = \'Completed\' AND ' +
                           'ClosedDate <=: daysAfterDeletion';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Task> scope) {
        if(scope != null && scope.size() > 0) {
            // delete the tasks
            delete scope;
        }
    }
    
    global void finish(Database.BatchableContext BC) {}
}