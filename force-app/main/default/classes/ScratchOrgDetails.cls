public with sharing class ScratchOrgDetails {
    
    @AuraEnabled(cacheable=true)
    public static Scratch_Org_Creds__c getScratchOrgDetails() {
        Scratch_Org_Creds__c details;
        for(Scratch_Org_Creds__c oDetails : [Select id,Org_Details__c,Req_ID__c,Components_Changed_Time__c, CreatedDate from Scratch_Org_Creds__c where name=:'ScratchOrgDetails' limit 1]){
            details = oDetails;
            break;
        }
        return details;
    }

    @AuraEnabled(cacheable=true)
    public static List<ScratchOrgDetails.sObjects> getOrgCountDetails() {
        string sOrgCount;
        for(Scratch_Org_Creds__c oDetails : [Select id,Org_Details__c,Data__c from Scratch_Org_Creds__c where name=:'ScratchOrgDetails' limit 1]){
            sOrgCount = oDetails.Data__c;
            break;
        }

        ScratchOrgDetails details =  (ScratchOrgDetails) System.JSON.deserialize(sOrgCount, ScratchOrgDetails.class);
        details.sObjects.sort();
        return details.sObjects;
    }

    @AuraEnabled(cacheable=true)
    public static Scratch_Org_Creds__c getOrglimits() {
        Scratch_Org_Creds__c sOrglimit;
        for(Scratch_Org_Creds__c oDetails : [Select id,Org_Details__c,Sandbox_Limits__c, Components_Changed_Time__c, CreatedDate from Scratch_Org_Creds__c where name=:'ScratchOrgDetails' limit 1]){
            sOrglimit = oDetails;
            break;
        }

        return sOrglimit;
    }

    @AuraEnabled
    public List<SObjects> sObjects;

	public class SObjects implements Comparable{
        @AuraEnabled
		public Integer count;
        @AuraEnabled
		public String name;

        Public Integer compareTo(Object objToCompare) {
            return name.compareTo(((SObjects)objToCompare).name);            
	    }
	}

    @AuraEnabled(cacheable=true)
    public static List<SObjects> getOrgCountDetailsUpgraded() {
        String standardobjects = 'Contract,Order,Document,Campaign,Account,Contact,Lead,Opportunity,Product2,Asset,Case,Solution';
        List<SObjects> lObjectList = new List<SObjects>();
        
        for(Schema.SObjectType o : Schema.getGlobalDescribe().Values()){
        Schema.DescribeSObjectResult objResult = o.getDescribe();
            if(objResult.getKeyPrefix()!=null && objResult.isCustomSetting()==false && !objResult.getName().contains('__e') && 
                (objResult.isCustom() || standardobjects.contains(objResult.getName()))){ 
                    SObjects obj = new SObjects();
                    obj.count = Database.countQuery('SELECT count() FROM '+objResult.getName());
                    obj.name = objResult.getName();
                    if(obj.count>0){
                        lObjectList.add(obj);
                    }
            }

        }

        lObjectList.sort();

        system.debug('####'+lObjectList);
       
        return lObjectList;
    }
	
	@AuraEnabled(cacheable=true)
    public static Scratch_Org_Creds__c getScratchOrgChanges() {
        Scratch_Org_Creds__c details;
        for(Scratch_Org_Creds__c oDetails : [Select id,Org_Details__c,Components_Changed__c, Components_Changed_Time__c, Req_ID__c, CreatedDate from Scratch_Org_Creds__c where name=:'ScratchOrgDetails' limit 1]){
            details = oDetails;
            break;
        }
        return details;
    }

   
   
}
