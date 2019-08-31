List<UserRole> listRoles = [Select Id, Name, DeveloperName from UserRole where DeveloperName = 'Assistant_Media_Planner' or DeveloperName = 'Desktop_Support_Technician'];

List<User> listUser = [Select Id,Name from User where IsActive = false];

List<Profile> listprofile = [SELECT Id, Name FROM Profile WHERE Name = 'Clinical Specialist' or Name = 'Product Engineer'];

integer i=0;

for(ContentAsset oAsset : [SELECT ContentDocumentId, DeveloperName FROM ContentAsset where DeveloperName like 'image%' limit 8]){
    ConnectApi.UserProfiles.setPhoto(null, listUser[i].Id, oAsset.ContentDocumentId,null);
    i++;
}


List<Notification__c> listnotifi = new List<Notification__c>();

Notification__c oNot1 = new Notification__c();
oNot1.Message__c = 'Workplace Harassment & Discrimination Prevention. All faculty and staff are required to complete the web-based mandatory training by June 30, 2019';
oNot1.Priority__c = 'Critical';
oNot1.Status__c = 'Notification Sent';
listnotifi.add(oNot1);

Notification__c oNot2 = new Notification__c();
oNot2.Message__c = 'Bargaining Unit 10 Dependent Health Vesting Elimination -  The Bargaining Unit 10 contract is ratified. Dependent health vesting is eliminated effective July 1, 2018';
oNot2.Priority__c = 'High';
oNot2.Status__c = 'Notification Sent';
listnotifi.add(oNot2);

Notification__c oNot3 = new Notification__c();
oNot3.Message__c = 'Dependent Re-Verification (DRV) - Beginning with the May birth month DRV cycle, HR offices are not required to re-verify eligibility of employee dependents for continued enrollment in Premier Vision benefits. HR offices will continue to re-verify employee dependents for state-sponsored health and dental benefits';
oNot3.Priority__c = 'Critical';
oNot3.Status__c = 'Notification Sent';
listnotifi.add(oNot3);

Notification__c oNot4 = new Notification__c();
oNot4.Message__c = 'OPEB Changes Effective July 1, 2018 - Excluded and exempt employees not directly associated with a bargaining unit, e.g., E48, E97, E98, and E99, will begin prefunding 0.8% of their pensionable compensation to Other Post-Employment Benefits (OPEB) effective July 1, 2018. There will be a matching employer contribution';
oNot4.Priority__c = 'Info';
oNot4.Status__c = 'Notification Sent';
listnotifi.add(oNot4);

Insert listnotifi;

List<Audience__c> audiences = new List<Audience__c>();

Audience__c audience1 = new Audience__c(Notification__c = listnotifi[0].Id, Type__c = 'Profile', Group_Id__c = listprofile[0].Id, Group_Name__c = listprofile[0].Name);
Audience__c audience2 = new Audience__c(Notification__c = listnotifi[0].Id, Type__c = 'Role', Group_Id__c = listRoles[0].Id, Group_Name__c = listRoles[0].Name);
Audience__c audience3 = new Audience__c(Notification__c = listnotifi[0].Id, Type__c = 'Profile', Group_Id__c = listprofile[1].Id, Group_Name__c = listprofile[1].Name);
Audience__c audience4 = new Audience__c(Notification__c = listnotifi[0].Id, Type__c = 'Role', Group_Id__c = listRoles[1].Id, Group_Name__c = listRoles[1].Name);
Audience__c audienceadmin1 = new Audience__c(Notification__c = listnotifi[0].Id, Type__c = 'Profile', Group_Id__c = UserInfo.getProfileId(), Group_Name__c = 'System Administrator');

Audience__c audience5 = new Audience__c(Notification__c = listnotifi[1].Id, Type__c = 'Profile', Group_Id__c = listprofile[0].Id, Group_Name__c = listprofile[0].Name);
Audience__c audience6 = new Audience__c(Notification__c = listnotifi[1].Id, Type__c = 'Role', Group_Id__c = listRoles[0].Id, Group_Name__c = listRoles[0].Name);
Audience__c audience7 = new Audience__c(Notification__c = listnotifi[1].Id, Type__c = 'Profile', Group_Id__c = listprofile[1].Id, Group_Name__c = listprofile[1].Name);
Audience__c audience8 = new Audience__c(Notification__c = listnotifi[1].Id, Type__c = 'Role', Group_Id__c = listRoles[1].Id, Group_Name__c = listRoles[1].Name);
Audience__c audienceadmin2 = new Audience__c(Notification__c = listnotifi[1].Id, Type__c = 'Profile', Group_Id__c = UserInfo.getProfileId(), Group_Name__c = 'System Administrator');

Audience__c audience9 = new Audience__c(Notification__c = listnotifi[2].Id, Type__c = 'Profile', Group_Id__c = listprofile[0].Id, Group_Name__c = listprofile[0].Name);
Audience__c audience10 = new Audience__c(Notification__c = listnotifi[2].Id, Type__c = 'Role', Group_Id__c = listRoles[0].Id, Group_Name__c = listRoles[0].Name);
Audience__c audience11 = new Audience__c(Notification__c = listnotifi[2].Id, Type__c = 'Profile', Group_Id__c = listprofile[1].Id, Group_Name__c = listprofile[1].Name);
Audience__c audience12 = new Audience__c(Notification__c = listnotifi[2].Id, Type__c = 'Role', Group_Id__c = listRoles[1].Id, Group_Name__c = listRoles[1].Name);
Audience__c audienceadmin3 = new Audience__c(Notification__c = listnotifi[2].Id, Type__c = 'Profile', Group_Id__c = UserInfo.getProfileId(), Group_Name__c = 'System Administrator');

Audience__c audience13 = new Audience__c(Notification__c = listnotifi[3].Id, Type__c = 'Role', Group_Id__c = listRoles[0].Id, Group_Name__c = listRoles[0].Name);
Audience__c audienceadmin4 = new Audience__c(Notification__c = listnotifi[3].Id, Type__c = 'Profile', Group_Id__c = UserInfo.getProfileId(), Group_Name__c = 'System Administrator');

//Audience__c audience14 = new Audience__c(Notification__c = listnotifi[4].Id, Type__c = 'Role', Group_Id__c = listRoles[1].Id, Group_Name__c = listRoles[1].Name);
//Audience__c audienceadmin5 = new Audience__c(Notification__c = listnotifi[4].Id, Type__c = 'Profile', Group_Id__c = UserInfo.getProfileId(), Group_Name__c = 'System Administrator');

audiences.add(audience1);
audiences.add(audience2);
audiences.add(audience3);
audiences.add(audience4);
audiences.add(audience5);
audiences.add(audience6);
audiences.add(audience7);
audiences.add(audience8);
audiences.add(audience9);
audiences.add(audience10);
audiences.add(audience11);
audiences.add(audience12);
audiences.add(audience13);
//audiences.add(audience14);

audiences.add(audienceadmin1);
audiences.add(audienceadmin2);
audiences.add(audienceadmin3);
audiences.add(audienceadmin4);
//audiences.add(audienceadmin5);

insert audiences;

List<Audience_Response__c> responses = new List<Audience_Response__c>();

Audience_Response__c response1 = new Audience_Response__c(Notification__c = listnotifi[0].Id, User__c = listUser[0].Id, Response_Time__c = System.now());
Audience_Response__c response2 = new Audience_Response__c(Notification__c = listnotifi[0].Id, User__c = listUser[1].Id, Response_Time__c = System.now());
Audience_Response__c response3 = new Audience_Response__c(Notification__c = listnotifi[0].Id, User__c = listUser[2].Id, Response_Time__c = System.now());

Audience_Response__c response4 = new Audience_Response__c(Notification__c = listnotifi[1].Id, User__c = listUser[3].Id, Response_Time__c = System.now());
Audience_Response__c response5 = new Audience_Response__c(Notification__c = listnotifi[1].Id, User__c = listUser[4].Id, Response_Time__c = System.now());

Audience_Response__c response6 = new Audience_Response__c(Notification__c = listnotifi[2].Id, User__c = listUser[5].Id, Response_Time__c = System.now());
Audience_Response__c response7 = new Audience_Response__c(Notification__c = listnotifi[2].Id, User__c = listUser[6].Id, Response_Time__c = System.now());
Audience_Response__c response8 = new Audience_Response__c(Notification__c = listnotifi[2].Id, User__c = listUser[1].Id, Response_Time__c = System.now());
Audience_Response__c response9 = new Audience_Response__c(Notification__c = listnotifi[2].Id, User__c = listUser[2].Id, Response_Time__c = System.now());

responses.add(response1);
responses.add(response2);
responses.add(response3);
responses.add(response4);
responses.add(response5);
responses.add(response6);
responses.add(response7);
responses.add(response8);
responses.add(response9);
insert responses;

