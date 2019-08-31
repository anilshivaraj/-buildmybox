List<UserRole> listRoles = [Select Id, Name, DeveloperName from UserRole where DeveloperName = 'Assistant_Media_Planner' or DeveloperName = 'Desktop_Support_Technician'];

List<User> listUser = new List<User>();

List<Profile> listprofile = [SELECT Id, Name FROM Profile WHERE Name = 'Clinical Specialist' or Name = 'Product Engineer'];

List<PermissionSet> listpermset = [SELECT Id, Name FROM PermissionSet WHERE Name = 'Disability_insurance'];

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

PermissionSetAssignment oPerm = new PermissionSetAssignment();
oPerm.AssigneeId = Userinfo.getuserId();
oPerm.PermissionSetId = listpermset[0].Id;

Insert oPerm;

