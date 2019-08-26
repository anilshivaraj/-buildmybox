public with sharing class ScratchOrgDetails {
    
    @AuraEnabled(cacheable=true)
    public static Scratch_Org_Creds__c getScratchOrgDetails() {
        Scratch_Org_Creds__c details;
        for(Scratch_Org_Creds__c oDetails : [Select id,Org_Details__c,ReqID__c,ReqSFID__c,Req_ID__c,Components_Changed_Time__c, CreatedDate from Scratch_Org_Creds__c where name=:'ScratchOrgDetails' limit 1]){
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
        for(Scratch_Org_Creds__c oDetails : [Select id,Org_Details__c, Components_Changed_Time__c, CreatedDate from Scratch_Org_Creds__c where name=:'ScratchOrgDetails' limit 1]){
            sOrglimit = oDetails;
            break;
        }

        return sOrglimit;
    }

    @AuraEnabled(cacheable=true)
    public static List<System.OrgLimit> getOrglimitcorrectway() {
        List<System.OrgLimit> limits = OrgLimits.getAll();
        for (System.OrgLimit aLimit: limits) {
            System.debug('Limit: ' + aLimit.getName());
            System.debug('Max Limit is: ' + aLimit.getLimit());
        }
        return limits;
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
            if(objResult.getKeyPrefix()!=null && objResult.isCustomSetting()==false &&
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
        for(Scratch_Org_Creds__c oDetails : [Select id,ReqID__c,ReqSFID__c,Org_Details__c,Components_Changed__c, Components_Changed_Time__c, Req_ID__c, CreatedDate from Scratch_Org_Creds__c where name=:'ScratchOrgDetails' limit 1]){
            details = oDetails;
            break;
        }
        return details;
    }

    @AuraEnabled(cacheable=true)
    public static List<Request_Scratch_Org__c> getScratchOrgRequests(Id CreatedByUserId) {
        List<Request_Scratch_Org__c> scratchOrgReq = [Select Id, CreatedById, createdDate from Request_Scratch_Org__c where CreatedById=: CreatedByUserId];
        return scratchOrgReq;
    }

    @AuraEnabled
    public static String createMigrationReq(Id ReqId) {
        
        Request_Scratch_Org__c scratchOrgReq = [Select Id, Components_Changed__c from Request_Scratch_Org__c where Id=: ReqId LIMIT 1];
        Migration_Request__c migRequest = new Migration_Request__c(Request_ID__c = ReqId, Status__c = 'Draft');
        String listOfVals='';
        //system.debug('scratchOrgReq.Components_Changed__c: '+scratchOrgReq.Components_Changed__c);
        for(String eachChange : scratchOrgReq.Components_Changed__c.split('[\n\r]')){
           // system.debug('eachChange: '+eachChange);
            if (!eachChange.startsWith('STATE') &&
                !eachChange.startsWith('===') &&
                !eachChange.startsWith('─────')
                ){
                List<String> res = new List<String>();
                res = eachChange.split(' +'); 
                //system.debug('res: '+res);
                if(listOfVals == '')
                    listOfVals =  res[1];
                else if(!listOfVals.contains(res[1]))
                    listOfVals = listOfVals + ', ' + res[1] ;
            }
        }
        migRequest.Components_Submitted__c = listOfVals;
        insert migRequest;
        return migRequest.Id;
    }

    @AuraEnabled
    public static wOrgLimitDetails getScratchOrgDetailsforflow() {
        Map<String,System.OrgLimit> limitsMap = OrgLimits.getMap();
        
        //Total Scratch Org
        wOrgLimitDetails wObj = new wOrgLimitDetails();
        wObj.totalActiveScratchOrgsMax = limitsMap.get('ActiveScratchOrgs').getLimit();
        wObj.totalActiveScratchOrgsCurrent = limitsMap.get('ActiveScratchOrgs').getValue();
       
        wObj.totalActiveScratchOrgPercent =  Math.round((wObj.totalActiveScratchOrgsCurrent/wObj.totalActiveScratchOrgsMax) * 100);
        
        //Daily Scratch Org
        wObj.dailyScratchOrgsMax = limitsMap.get('DailyScratchOrgs').getLimit();
        wObj.dailyScratchOrgsCurrent = limitsMap.get('DailyScratchOrgs').getValue();
        
        wObj.dailyScratchOrgPercent =  Math.round((wObj.dailyScratchOrgsCurrent/wObj.dailyScratchOrgsMax) * 100);
        

        wObj.yourActiveScratchOrgs =  [Select count() from ActiveScratchOrg where Requested_User__c =: UserInfo.getUserId()];
        wObj.yourAllowedActiveScratchOrgs =  BuildMyBox__c.getValues('CircleCI Setup Values').of_Active_Scratch_Orgs_for_User__c;
        
        wObj.yourAllowedActiveScratchOrgsPercent =  Math.round((wObj.yourActiveScratchOrgs/wObj.yourAllowedActiveScratchOrgs) * 100);
        
        return wObj;
    }

    Public class wOrgLimitDetails{
        @AuraEnabled Public Integer totalActiveScratchOrgsMax;
        @AuraEnabled Public Decimal totalActiveScratchOrgsCurrent;
        @AuraEnabled Public Decimal totalActiveScratchOrgPercent;
        @AuraEnabled Public Integer dailyScratchOrgsCurrent;
        @AuraEnabled Public Decimal dailyScratchOrgsMax;
        @AuraEnabled Public Decimal dailyScratchOrgPercent;
        @AuraEnabled Public Integer yourActiveScratchOrgs;
        @AuraEnabled Public decimal yourAllowedActiveScratchOrgs;
        @AuraEnabled Public decimal yourAllowedActiveScratchOrgsPercent;
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
                else if(oLimit.sName == 'DataStorageMB'){
                     oLimit.sName = '*DataStorageMB';
                }
                else if(oLimit.sName == 'FileStorageMB'){
                     oLimit.sName = '*FileStorageMB';
                }
                lOrgLimit.add(oLimit);
            }
        }
        lOrgLimit.sort();    

        return lOrgLimit;
    }

   
}
