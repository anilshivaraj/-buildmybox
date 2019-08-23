({
  checkValidityHelper: function(component, event) {
    var action = component.get("c.checkEligibility");

    action.setParams({
      NotificationId: component.get("v.NotificationId")
    });

    action.setCallback(this, function(a) {
      var state = a.getState();
      if (state == "SUCCESS") {
        if (a.getReturnValue()) {
            if(component.get("v.isRecall")){
                $A.get('e.force:refreshView').fire();
                this.getOldMessages(component, event);
                this.getNewMessages(component, event);
                //component.find("tabs").set("v.selectedTabId","one");
                console.log('refreshed');
            }
            else{
                this.getNewMessages(component, event);
                var utilityAPI = component.find("utilitybar");
                if (component.get("v.Priority") == "Critical") {
                    utilityAPI.openUtility();
                    utilityAPI.setUtilityHighlighted({ highlighted: true });
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        message: component.get("v.Description"),
                        type: "success",
                        mode: "sticky",
                        key: "announcement"
                    });
                    toastEvent.fire();
                } else if (component.get("v.Priority") == "High") {
                    utilityAPI.setUtilityHighlighted({ highlighted: true });
                }
            }
          
        }
      }
    });
    $A.enqueueAction(action);
  },

  createResponseHelper: function(component, event) {
    var notificationId = event.getSource().get("v.id");
    var today = new Date();
    var action = component.get("c.insertResponse");

    action.setParams({
      NotificationId: notificationId
    });

    action.setCallback(this, function(a) {
      var state = a.getState();
      if (state == "SUCCESS") {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
          message: "Notification acknowledged at " + today.toLocaleString(),
          type: "success",
          mode: "dismissible",
          duration: 3000
        });
        toastEvent.fire();
        $A.get('e.force:refreshView').fire();
        this.getNewMessages(component, event);
        this.getOldMessages(component, event);
      }
    });

    $A.enqueueAction(action);
  },

  subscribeHelper: function(component, event) {
    // Get the empApi component
    const empApi = component.find("empApi");
    // Set the channel
    const channel = "/event/Send_Notification__e";
    // Replay option to get new events
    const replayId = -1;

    // Subscribe to an event
    empApi
      .subscribe(
        channel,
        replayId,
        $A.getCallback(eventReceived => {
          // Process event (this is called each time we receive an event)
          component.set(
            "v.isRecall",
            eventReceived.data.payload.Recalled__c
          );
          component.set(
            "v.Description",
            eventReceived.data.payload.Notification_Message__c
          );
          component.set(
            "v.NotificationId",
            eventReceived.data.payload.NotificationId__c
          );
          component.set(
            "v.NotificationNumber",
            eventReceived.data.payload.Notification_Number__c
          );
          component.set("v.Priority", eventReceived.data.payload.Priority__c);
            
          this.checkValidityHelper(component, event);
		})
      )
      .then(subscription => {
        // Save subscription to unsubscribe later
        console.log('Subscribed to channel ', subscription.channel);
        component.set("v.subscription", subscription);
      });
  },

  // Invokes the unsubscribe method on the empApi component
  unsubscribe: function(component, event) {
    // Get the empApi component
    const empApi = component.find("empApi");
    // Get the subscription that we saved when subscribing
    const subscription = component.get("v.subscription");

    // Unsubscribe from event
    empApi.unsubscribe(
      subscription,
      $A.getCallback(unsubscribed => {
        // Confirm that we have unsubscribed from the event channel
        component.set("v.subscription", null);
      })
    );
  },

  getOldMessages: function(component, event) {
    var action = component.get("c.getAckMessages");
    action.setParams({});
    action.setCallback(this, function(response) {
      var state = response.getState();
      if (state == "SUCCESS") {
        component.set("v.AcknowledgedMessages", response.getReturnValue());
      }
    });
    $A.enqueueAction(action);
  },

  getNewMessages: function(component, event) {
      component.set("v.loaded", true);
    var action = component.get("c.getNewMessages");
    action.setParams({});
    action.setCallback(this, function(response) {
      var state = response.getState();
      if (state == "SUCCESS") {
        component.set("v.UnreadMessages", response.getReturnValue());
          component.set("v.loaded", false);
      }
    });
    $A.enqueueAction(action);
  },

  getHallOfShame: function(component, event) {
    var action = component.get("c.getWallOfShameUsers");
    action.setParams({});
    action.setCallback(this, function(response) {
      var state = response.getState();
      if (state == "SUCCESS") {
        component.set("v.ShameList", response.getReturnValue());
      }
    });

    $A.enqueueAction(action);
  }
});