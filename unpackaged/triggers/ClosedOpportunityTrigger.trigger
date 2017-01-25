trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {

    List<Task> taskList = new List<Task>();
    for(Opportunity o : Trigger.new){
        if(o.StageName=='Closed Won'){
            taskList.add(new Task(Subject = 'Follow Up Test Task', Status = 'Open',Priority = 'Normal',WhatId = o.Id));
        }
    }
    insert taskList;


    //https://github.com/willianpaulop/Trailhead.git

    //teste

    //outro teste;
    //teste teste teste

}