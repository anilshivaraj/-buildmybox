List<UserRole> listRoles = [Select Id, Name, DeveloperName from UserRole where DeveloperName = 'Assistant_Media_Planner' or DeveloperName = 'Desktop_Support_Technician'];

List<User> listUser = [Select Id,Name from User where IsActive = false or Profile.Name = 'System Administrator'];

List<Profile> listprofile = [SELECT Id, Name FROM Profile WHERE Name = 'Clinical Specialist' or Name = 'Product Engineer'];

integer i=0;

for(ContentAsset oAsset : [SELECT ContentDocumentId, DeveloperName FROM ContentAsset where DeveloperName like 'image%' limit 9]){
    ConnectApi.UserProfiles.setPhoto(null, listUser[i].Id, oAsset.ContentDocumentId,null);
    i++;
}


List<Notification__c> listnotifi = new List<Notification__c>();

Notification__c oNot1 = new Notification__c();
oNot1.Message__c = 'Workplace Harassment & Discrimination Prevention. All faculty and staff are required to complete the web-based mandatory training by June 30, 2019';
oNot1.Priority__c = 'Critical';
oNot1.Status__c = 'Notification Sent';
oNot1.createdbyId = listUser[0].Id;
oNot1.CreatedDate = system.now()-40;
listnotifi.add(oNot1);

Notification__c oNot2 = new Notification__c();
oNot2.Message__c = 'Bargaining Unit 10 Dependent Health Vesting Elimination -  The Bargaining Unit 10 contract is ratified. Dependent health vesting is eliminated effective July 1, 2018';
oNot2.Priority__c = 'High';
oNot2.Status__c = 'Notification Sent';
oNot2.createdbyId = listUser[1].Id;
oNot2.CreatedDate = system.now()-60;
listnotifi.add(oNot2);

Notification__c oNot3 = new Notification__c();
oNot3.Message__c = 'Dependent Re-Verification (DRV) - Beginning with the May birth month DRV cycle, HR offices are not required to re-verify eligibility of employee dependents for continued enrollment in Premier Vision benefits. HR offices will continue to re-verify employee dependents for state-sponsored health and dental benefits';
oNot3.Priority__c = 'Critical';
oNot3.Status__c = 'Notification Sent';
oNot3.createdbyId = listUser[2].Id;
oNot3.CreatedDate = system.now()-90;
listnotifi.add(oNot3);

Notification__c oNot4 = new Notification__c();
oNot4.Message__c = 'OPEB Changes Effective July 1, 2018 - Excluded and exempt employees not directly associated with a bargaining unit, e.g., E48, E97, E98, and E99, will begin prefunding 0.8% of their pensionable compensation to Other Post-Employment Benefits (OPEB) effective July 1, 2018. There will be a matching employer contribution';
oNot4.Priority__c = 'Info';
oNot4.Status__c = 'Notification Sent';
oNot4.createdbyId = listUser[3].Id;
oNot4.CreatedDate = system.now()-80;
listnotifi.add(oNot4);

Notification__c oNot5 = new Notification__c();
oNot5.Message__c = 'CC Authorization Server - Please be advised that the network will be unavailable from 01:00am to 05:30am on July 12th, 2019. This period of downtime will be scheduled for necessary updates to be applied to the network server. Ensure you close out any pay grievances for South Cal, North Cal and CO region today and queue CC request to 12th July.';
oNot5.Priority__c = 'Info';
oNot5.Status__c = 'Notification Sent';
oNot5.createdbyId = listUser[4].Id;
oNot5.CreatedDate = system.now()-70;
listnotifi.add(oNot5);

Notification__c oNot6 = new Notification__c();
oNot6.Message__c = 'Oregon employers are required by a number of state and federal agencies to display a variety of workplace notices and posters. These notices should be posted where employees may regularly view them. The Spanish versions should also be posted if there is the possibility that one or more of your employees will not be able to read or understand the English versions. Employers with more than one work location are generally required to display these posters at each worksite.';
oNot6.Priority__c = 'Info';
oNot6.Status__c = 'Notification Sent';
oNot6.createdbyId = listUser[5].Id;
oNot6.CreatedDate = system.now()-60;
listnotifi.add(oNot6);

Notification__c oNot7 = new Notification__c();
oNot7.Message__c = '2019 Benefits Administration Training Class - This year CalHR will conduct Benefits Administration Training classes on March 19-20, April 9-10, May 13-14, July 17-18, Aug 13-14 and October 16-17. This class is specifically designed for new personnel staff responsible for providing state employee benefit information.';
oNot7.Priority__c = 'Info';
oNot7.Status__c = 'Notification Sent';
oNot7.createdbyId = listUser[6].Id;
oNot7.CreatedDate = system.now()-58;
listnotifi.add(oNot7);

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
Audience__c audienceadmin5 = new Audience__c(Notification__c = listnotifi[4].Id, Type__c = 'Profile', Group_Id__c = UserInfo.getProfileId(), Group_Name__c = 'System Administrator');
Audience__c audienceadmin6 = new Audience__c(Notification__c = listnotifi[5].Id, Type__c = 'Profile', Group_Id__c = UserInfo.getProfileId(), Group_Name__c = 'System Administrator');
Audience__c audienceadmin7 = new Audience__c(Notification__c = listnotifi[6].Id, Type__c = 'Profile', Group_Id__c = UserInfo.getProfileId(), Group_Name__c = 'System Administrator');


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
audiences.add(audienceadmin5);
audiences.add(audienceadmin6);
audiences.add(audienceadmin7);

insert audiences;

List<Audience_Response__c> responses = new List<Audience_Response__c>();

Audience_Response__c response1 = new Audience_Response__c(Notification__c = listnotifi[0].Id, User__c = listUser[0].Id, Response_Time__c = System.now());
Audience_Response__c response2 = new Audience_Response__c(Notification__c = listnotifi[0].Id, User__c = listUser[1].Id, Response_Time__c = System.now());
Audience_Response__c response3 = new Audience_Response__c(Notification__c = listnotifi[0].Id, User__c = listUser[2].Id, Response_Time__c = System.now());
Audience_Response__c responseadmin1 = new Audience_Response__c(Notification__c = listnotifi[0].Id, User__c = UserInfo.getuserId(), Response_Time__c = System.now()-10);

Audience_Response__c response4 = new Audience_Response__c(Notification__c = listnotifi[1].Id, User__c = listUser[3].Id, Response_Time__c = System.now());
Audience_Response__c response5 = new Audience_Response__c(Notification__c = listnotifi[1].Id, User__c = listUser[4].Id, Response_Time__c = System.now());
Audience_Response__c responseadmin2 = new Audience_Response__c(Notification__c = listnotifi[1].Id, User__c = UserInfo.getuserId(), Response_Time__c = System.now()-30);

Audience_Response__c response6 = new Audience_Response__c(Notification__c = listnotifi[2].Id, User__c = listUser[5].Id, Response_Time__c = System.now());
Audience_Response__c response7 = new Audience_Response__c(Notification__c = listnotifi[2].Id, User__c = listUser[6].Id, Response_Time__c = System.now());
Audience_Response__c response8 = new Audience_Response__c(Notification__c = listnotifi[2].Id, User__c = listUser[1].Id, Response_Time__c = System.now());
Audience_Response__c response9 = new Audience_Response__c(Notification__c = listnotifi[2].Id, User__c = listUser[2].Id, Response_Time__c = System.now());
Audience_Response__c responseadmin3 = new Audience_Response__c(Notification__c = listnotifi[2].Id, User__c = UserInfo.getuserId(), Response_Time__c = System.now()-20);

responses.add(response1);
responses.add(response2);
responses.add(response3);
responses.add(response4);
responses.add(response5);
responses.add(response6);
responses.add(response7);
responses.add(response8);
responses.add(response9);
responses.add(responseadmin1);
responses.add(responseadmin2);
responses.add(responseadmin3);

insert responses;

