StaticResource botCommandsResource = [SELECT Id, Body from StaticResource WHERE Name = 'botCommands'];
String botCommandsJSON = botCommandsResource.body.toString();
List<Bot_Command__c> botCommands = (List<Bot_Command__c>) JSON.deserialize(botCommandsJSON, List<Bot_Command__c>.class);
insert botCommands;

StaticResource brokersResource = [SELECT Id, Body from StaticResource WHERE Name = 'brokers'];
String brokersJSON = brokersResource.body.toString();
List<Broker__c> brokers = (List<Broker__c>) JSON.deserialize(brokersJSON, List<Broker__c>.class);
insert brokers;

StaticResource propertiesResource = [SELECT Id, Body from StaticResource WHERE Name = 'properties'];
String propertiesJSON = propertiesResource.body.toString();
List<Property__c> properties = (List<Property__c>) JSON.deserialize(propertiesJSON, List<Property__c>.class);
insert properties; 