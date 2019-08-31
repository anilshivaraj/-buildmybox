/*List<UserRole> listRoles = [Select Id, Name, DeveloperName from UserRole where DeveloperName like '%MyCustomRole%'];
Profile profile1= [SELECT Id, Name FROM Profile WHERE Name = 'Contract Manager'];
Profile profile2= [SELECT Id, Name FROM Profile WHERE Name = 'Custom: Sales Profile'];
List<Notification__c> notificationList = [Select Id from Notification__c limit 4];
List<User> listUser = [Select Id from User where LastName like '%potter%'];
List<Audience__c> audiences = new List<Audience__c>();

Audience__c audience1 = new Audience__c(Notification__c = notificationList[0].Id, Type__c = 'Profile', Group_Id__c = profile1.Id, Group_Name__c = profile1.Name);
Audience__c audience2 = new Audience__c(Notification__c = notificationList[0].Id, Type__c = 'Role', Group_Id__c = listRoles[0].Id, Group_Name__c = listRoles[0].Name);
Audience__c audience3 = new Audience__c(Notification__c = notificationList[0].Id, Type__c = 'Profile', Group_Id__c = profile2.Id, Group_Name__c = profile2.Name);
Audience__c audience4 = new Audience__c(Notification__c = notificationList[0].Id, Type__c = 'Role', Group_Id__c = listRoles[1].Id, Group_Name__c = listRoles[1].Name);
Audience__c audience5 = new Audience__c(Notification__c = notificationList[1].Id, Type__c = 'Profile', Group_Id__c = profile1.Id, Group_Name__c = profile1.Name);
Audience__c audience6 = new Audience__c(Notification__c = notificationList[1].Id, Type__c = 'Role', Group_Id__c = listRoles[0].Id, Group_Name__c = listRoles[0].Name);
Audience__c audience7 = new Audience__c(Notification__c = notificationList[1].Id, Type__c = 'Profile', Group_Id__c = profile2.Id, Group_Name__c = profile2.Name);
Audience__c audience8 = new Audience__c(Notification__c = notificationList[1].Id, Type__c = 'Role', Group_Id__c = listRoles[1].Id, Group_Name__c = listRoles[1].Name);
Audience__c audience9 = new Audience__c(Notification__c = notificationList[2].Id, Type__c = 'Profile', Group_Id__c = profile1.Id, Group_Name__c = profile1.Name);
Audience__c audience10 = new Audience__c(Notification__c = notificationList[2].Id, Type__c = 'Role', Group_Id__c = listRoles[0].Id, Group_Name__c = listRoles[0].Name);
Audience__c audience11 = new Audience__c(Notification__c = notificationList[2].Id, Type__c = 'Profile', Group_Id__c = profile2.Id, Group_Name__c = profile2.Name);
Audience__c audience12 = new Audience__c(Notification__c = notificationList[2].Id, Type__c = 'Role', Group_Id__c = listRoles[1].Id, Group_Name__c = listRoles[1].Name);
Audience__c audience13 = new Audience__c(Notification__c = notificationList[3].Id, Type__c = 'Role', Group_Id__c = listRoles[1].Id, Group_Name__c = listRoles[1].Name);

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

insert audiences;

List<Audience_Response__c> responses = new List<Audience_Response__c>();

Audience_Response__c response1 = new Audience_Response__c(Notification__c = notificationList[0].Id, User__c = listUser[0].Id, Response_Time__c = System.now());
Audience_Response__c response2 = new Audience_Response__c(Notification__c = notificationList[0].Id, User__c = listUser[1].Id, Response_Time__c = System.now());
Audience_Response__c response3 = new Audience_Response__c(Notification__c = notificationList[0].Id, User__c = listUser[2].Id, Response_Time__c = System.now());

Audience_Response__c response4 = new Audience_Response__c(Notification__c = notificationList[1].Id, User__c = listUser[3].Id, Response_Time__c = System.now());
Audience_Response__c response5 = new Audience_Response__c(Notification__c = notificationList[1].Id, User__c = listUser[4].Id, Response_Time__c = System.now());

Audience_Response__c response6 = new Audience_Response__c(Notification__c = notificationList[2].Id, User__c = listUser[5].Id, Response_Time__c = System.now());
Audience_Response__c response7 = new Audience_Response__c(Notification__c = notificationList[2].Id, User__c = listUser[6].Id, Response_Time__c = System.now());
Audience_Response__c response8 = new Audience_Response__c(Notification__c = notificationList[2].Id, User__c = listUser[1].Id, Response_Time__c = System.now());
Audience_Response__c response9 = new Audience_Response__c(Notification__c = notificationList[2].Id, User__c = listUser[2].Id, Response_Time__c = System.now());

responses.add(response1);
responses.add(response2);
responses.add(response3);
responses.add(response4);
responses.add(response5);
responses.add(response6);
responses.add(response7);
responses.add(response8);
responses.add(response9);
insert responses;*/

List<UserRole> listRoles = [Select Id, Name, DeveloperName from UserRole where DeveloperName = 'Assistant_Media_Planner' or DeveloperName = 'Desktop_Support_Technician'];

List<User> listUser = new List<User>();

List<Profile> listprofile = [SELECT Id, Name FROM Profile WHERE Name = 'Clinical Specialist' or Name = 'Product Engineer'];

List<PermissionSet> listpermset = [SELECT Id, Name FROM PermissionSet WHERE Name = 'Combined_Federal_Campaign' or Name = 'Disability_insurance'];

User u1 = new User(
	LastName = 'Wanell',
	FirstName = 'Patton',
	Email = 'demonotificationuser1@example.com',
	Username = 'demonotificationuser1@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	// Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[0].Id,
	ProfileId = listprofile[0].Id,
	IsActive  = false
);
User u2 = new User(
	LastName = 'Sinisbury',
	FirstName = 'Rudy',
	Email = 'demonotificationuser2@example.com',
	Username = 'demonotificationuser2@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	// Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[0].Id,
	ProfileId = listprofile[0].Id,
	IsActive  = false
);
User u3 = new User(
	FirstName = 'Isadore',
	LastName = 'Worstall',
	Email = 'demonotificationuser3@example.com',
	Username = 'demonotificationuser3@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	// Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[0].Id,
	ProfileId = listprofile[0].Id,
	IsActive  = false
);
User u4 = new User(
	FirstName = 'Demetrius',
	LastName = 'Haseman',
	Email = 'demonotificationuser4@example.com',
	Username = 'demonotificationuser4@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	// Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[0].Id,
	ProfileId = listprofile[0].Id,
	IsActive  = false
);

User u5 = new User(
	
	LastName = 'Joyner',
	Email = 'demonotificationuser5@example.com',
	Username = 'demonotificationuser5@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	// Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[1].Id,
	ProfileId = listprofile[1].Id,
	IsActive  = false
);
User u6 = new User(
	FirstName = 'Law',
	LastName = 'Drakes',
	Email = 'demonotificationuser6@example.com',
	Username = 'demonotificationuser6@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	// Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[1].Id,
	ProfileId = listprofile[1].Id,
	IsActive  = false
);
User u7 = new User(
	FirstName = 'Gerrie',
	LastName = 'Bentley',
	Email = 'demonotificationuser7@example.com',
	Username = 'demonotificationuser7@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	// Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[1].Id,
	ProfileId = listprofile[1].Id,
	IsActive  = false
);
User u8 = new User(
	FirstName = 'Lynn',
	LastName = 'Glas',
	Email = 'demonotificationuser8@example.com',
	Username = 'demonotificationuser8@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	// Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[1].Id,
	ProfileId = listprofile[1].Id,
	IsActive  = false
);

listUser.add(u1);
listUser.add(u2);
listUser.add(u3);
listUser.add(u4);
listUser.add(u5);
listUser.add(u6);
listUser.add(u7);
listUser.add(u8);


insert listUser;
integer i=0;


for(ContentAsset oAsset : [SELECT ContentDocumentId, DeveloperName FROM ContentAsset where DeveloperName like 'image%' limit 8]){
    ConnectApi.UserProfiles.setPhoto(null, listUser[i].Id, oAsset.ContentDocumentId,null);
    i++;
}

