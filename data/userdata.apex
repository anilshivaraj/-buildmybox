List<UserRole> listRoles = [Select Id, Name, DeveloperName from UserRole where DeveloperName like '%MyCustomRole%'];

List<User> listUser =new List<User>();

Profile profile1= [SELECT Id, Name FROM Profile WHERE Name = 'Contract Manager'];
User u1 = new User(
	ProfileId = profile1.Id,
	LastName = 'potter1',
	Email = 'demonotificationuser1@example.com',
	Username = 'demonotificationuser1@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[0].Id,
	IsActive  = false
);
User u2 = new User(
	ProfileId = profile1.Id,
	LastName = 'potter2',
	Email = 'demonotificationuser2@example.com',
	Username = 'demonotificationuser2@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[0].Id,
	IsActive  = false
);
User u3 = new User(
	ProfileId = profile1.Id,
	LastName = 'potter3',
	Email = 'demonotificationuser3@example.com',
	Username = 'demonotificationuser3@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[0].Id,
	IsActive  = false
);
User u4 = new User(
	ProfileId = profile1.Id,
	LastName = 'potter4',
	Email = 'demonotificationuser4@example.com',
	Username = 'demonotificationuser4@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[0].Id,
	IsActive  = false
);
listUser.add(u1);
listUser.add(u2);
listUser.add(u3);
listUser.add(u4);

Profile profile2= [SELECT Id, Name FROM Profile WHERE Name = 'Custom: Sales Profile'];

User u5 = new User(
	ProfileId = profile2.Id,
	LastName = 'potter5',
	Email = 'demonotificationuser5@example.com',
	Username = 'demonotificationuser5@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[1].Id,
	IsActive  = false
);
User u6 = new User(
	ProfileId = profile2.Id,
	LastName = 'potter6',
	Email = 'demonotificationuser6@example.com',
	Username = 'demonotificationuser6@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[1].Id,
	IsActive  = false
);
User u7 = new User(
	ProfileId = profile2.Id,
	LastName = 'potter7',
	Email = 'demonotificationuser7@example.com',
	Username = 'demonotificationuser7@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[1].Id,
	IsActive  = false
);
User u8 = new User(
	ProfileId = profile2.Id,
	LastName = 'potter8',
	Email = 'demonotificationuser8@example.com',
	Username = 'demonotificationuser8@example.com' + System.currentTimeMillis(),
	CompanyName = 'TEST',
	Title = 'title',
	Alias = 'alias',
	TimeZoneSidKey = 'America/Los_Angeles',
	EmailEncodingKey = 'UTF-8',
	LanguageLocaleKey = 'en_US',
	LocaleSidKey = 'en_US',
	UserRoleId = listRoles[1].Id,
	IsActive  = false
);
listUser.add(u5);
listUser.add(u6);
listUser.add(u7);
listUser.add(u8);


insert listUser;

