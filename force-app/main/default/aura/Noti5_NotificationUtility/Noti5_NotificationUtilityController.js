({
    onInit: function(component, event, helper) {
        // Get the empApi component
        const empApi = component.find("empApi");
        // empApi.setDebugFlag(true);
        helper.unsubscribe(component, event);
        helper.subscribeHelper(component, event);
        helper.getOldMessages(component, event);
        helper.getNewMessages(component, event);
        helper.getHallOfShame(component, event);
        // Register error listener and pass in the error handler function
        empApi.onError($A.getCallback(error => {
            // Error can be any type of error (subscribe, unsubscribe...)
            console.error('EMP API error: ', error);
        }));
    },
    
    handleCheckButtonClick: function(component, event, helper) {
        //Change the state of icon
        component.set("v.checked", !component.get("v.checked"));
        
        var utilityAPI = component.find("utilitybar");
        utilityAPI.minimizeUtility();
        utilityAPI.setUtilityHighlighted({ highlighted: false });
        
        helper.createResponseHelper(component, event);
    },
    
    refreshData: function(component, event, helper){
        
        helper.getOldMessages(component, event);
        helper.getNewMessages(component, event);
        helper.getHallOfShame(component, event);
        component.find("tabs").set("v.selectedTabId","one");
        
    }
});