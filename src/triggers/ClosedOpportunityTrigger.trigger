trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> taskListToInsert = new List<Task>();
    
    for(Opportunity opp:Trigger.new) {
        if(opp.StageName == 'Closed Won')
        {
            task t = new Task();
            t.Subject = 'Follow Up Test Task';
            t.WhatId = opp.Id;
            taskListToInsert.add(t);
        }
    }
    
    if(taskListToInsert.size() > 0)
    {
        insert taskListToInsert;
    }
}