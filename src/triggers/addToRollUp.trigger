trigger addToRollUp on Vote__c (before insert) {
    for(Vote__c v:Trigger.new)
    {
        if(trigger.isInsert)
        {
            v.Name = 'Alex';
            v.Contestant__c = 'Alex';
        }
    }
}