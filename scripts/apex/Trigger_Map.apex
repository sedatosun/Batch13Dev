Trigger_Map tgMap = new Trigger_Map();
Id newProjectId = tgMap.InsertSF_Project();
System.debug('New Project Id is : ' + newProjectId);
tgMap.UpdateSF_Project(newProjectId,'Updated Trigger Project');