@isTest
public class Noti5_LookupControllerTest {
    static testMethod void search_should_return_Value() {
        UserRole role = new UserRole(DeveloperName = 'MyCustomRole', Name = 'My Role');
        insert role;
        
        User usr = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].Id,
            LastName = 'Potter',
            Email = 'potter@hogwarts.com',
            Username = 'potter@hogwarts.com.test',
            CompanyName = 'TEST',
            Title = 'title',
            Alias = 'alias',
            TimeZoneSidKey = 'America/Los_Angeles',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            UserRoleId = role.Id
        );
        insert usr;

        //Initializing the User context
        System.runAs(usr){

            List<Group> groupList = new List<Group>();
            //Creating Queue Record
            groupList.add(new Group(Name='FAQ', type='Queue'));
            // Creating Public Group record
            groupList.add(new Group(Name='Service Agents'));

            insert groupList;
            //providing blank set of Ids
            List<String> selectedIds = new List<String>();

            Test.startTest();
            List<Noti5_LookupSearchResult> profileResults = Noti5_LookupController.search('Sys', selectedIds, 'Profile');
            System.assertNotEquals(null, profileResults[0].getId());

            List<Noti5_LookupSearchResult> roleResults = Noti5_LookupController.search('My', selectedIds, 'Role');
            System.assertEquals('standard:groups', roleResults[0].getIcon());
            
            List<Noti5_LookupSearchResult> queueResults = Noti5_LookupController.search('FAQ', selectedIds, 'Queue');
            System.assertEquals(null, queueResults[0].getSObjectType());

            List<Noti5_LookupSearchResult> publicGroupResults = Noti5_LookupController.search('Service', selectedIds, 'Public Group');
            System.assertEquals('Service Agents', publicGroupResults[0].getTitle());
            System.assertEquals('Public Group • Service Agents', publicGroupResults[0].getSubtitle());

            List<Noti5_LookupSearchResult> permissionSetResults = Noti5_LookupController.search('', selectedIds, 'Permission Set');

            Test.stopTest();
        }
    }
}