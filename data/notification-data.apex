List<UserRole> listRoles = [Select Id, Name, DeveloperName from UserRole where DeveloperName like '%MyCustomRole%'];
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
insert responses;