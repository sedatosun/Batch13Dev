string sf = Trigger_Map.InsertSF_Project();
system.debug(sf);

Trigger_Map.UpdateSF_Project(Trigger_Map.InsertSF_Project(), 'Updated Trigger Project');

//SOLUTION
/*
Trigger_Map tgMap = new Trigger_Map();
Id newProjectId = tgMap.InsertSF_Project();
System.debug('New Project Id is : ' + newProjectId);
tgMap.UpdateSF_Project(newProjectId,'Updated Trigger Project');
*/