trigger AccountMessage on Account (before insert, before update) {
	for(Account a:Trigger.new){
		if(Trigger.isUpdate && a.Name=='Teste'){
			a.addError('Record not updated');
		}
		else if(Trigger.isInsert && a.Name=='Error'){
			a.addError('Record not inserted');
		}
	}

}