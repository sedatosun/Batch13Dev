public class Trigger_Map {
    public Id InsertSF_Project() {
        //inserting new record
        Salesforce_Project__c  sfProject = new Salesforce_Project__c();
        insert sfProject;
        return sfProject.id;
    }

    public void UpdateSF_Project(id projectId, string projectName) {
        //getting record from org I just created
        Salesforce_Project__c sfProject = [SELECT Id, Project_Name__c from Salesforce_Project__c where Id = :projectId];
        //updating the record
        sfProject.Project_Name__c = projectName;
        
        update sfProject;
    }
}
//SOLUTION
/*
public class Trigger_Map {
    public Id InsertSF_Project() {
        Salesforce_Project__c sfProject = new Salesforce_Project__c();
        insert sfProject;
        return sfProject.id;
    }
    public void UpdateSF_Project(Id projectId, String projectName) {
        Salesforce_Project__c sfProject = [SELECT Id, Project_Name__c from Salesforce_Project__c where Id = :projectId];
        sfProject.Project_Name__c = projectName;
        update sfProject;
    }
}
*/