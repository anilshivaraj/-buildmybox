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

	Public class wOrgLimit implements Comparable{
        @AuraEnabled Public string sName{get;set;}
        @AuraEnabled Public double iMaximum{get;set;}
        @AuraEnabled Public double iCurrent{get;set;}
        @AuraEnabled Public double percentage{get;set;}
        Public Integer compareTo(Object objToCompare) {
            return sName.compareTo(((wOrgLimit)objToCompare).sName);            
	    }
    }

    @AuraEnabled
    public static List<wOrgLimit> getScratchOrgDetailsfulllist() {
        List<wOrgLimit> lOrgLimit = new List<wOrgLimit>();
        for (System.OrgLimit aLimit: OrgLimits.getAll()) {
            if(aLimit.getLimit()>0){
                wOrgLimit oLimit = new wOrgLimit();
                oLimit.iMaximum = aLimit.getLimit();
                oLimit.sName = aLimit.getName();
                oLimit.iCurrent = aLimit.getValue();
                
                if(oLimit.iCurrent==0){
                    oLimit.percentage = 0;
                }
                else{
                    oLimit.percentage = Math.round((oLimit.iCurrent/oLimit.iMaximum)*100);
                }

                if(oLimit.sName == 'DataStorageMB' && oLimit.iMaximum>10000){
                    oLimit.sName = '*DataStorageGB';
                    oLimit.iMaximum = (oLimit.iMaximum/1000).round();
                    oLimit.iCurrent = (oLimit.iCurrent/1000).round();
                }
                else if(oLimit.sName == 'FileStorageMB' && oLimit.iMaximum>10000){
                    oLimit.sName = '*FileStorageGB';
                    oLimit.iMaximum = (oLimit.iMaximum/1000).round();
                    oLimit.iCurrent = (oLimit.iCurrent/1000).round();
                }
                lOrgLimit.add(oLimit);
            }
        }
        lOrgLimit.sort();    

        return lOrgLimit;
    }   
   
}
