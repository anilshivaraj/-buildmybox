({
  getdetailsonload: function(cmp) {
    var action = cmp.get("c.getScratchOrgDetailsfulllist");
    action.setCallback(this, function(response) {
      var state = response.getState();
      if (state === "SUCCESS") {
        cmp.set("v.wrapperList", response.getReturnValue());
      }
    });
    $A.enqueueAction(action);
  }
});