import {
  LightningElement,
  api,
  wire,
  track
} from "lwc";
import getScratchOrgChanges from "@salesforce/apex/ScratchOrg_ServiceHandler.getScratchOrgChanges";
import {
  ShowToastEvent
} from "lightning/platformShowToastEvent";
//import checkdiffOrg from "@salesforce/apex/DECI_CreateScratchOrg.checkdiff";

export default class ScratchOrgChanges extends LightningElement {
  @api recordId;
  @track record;
  @track error;
  @track lastModifiedDate;
  username;
  reqid;
  reqsfid;

  @track
  listofChanges = [];

  @wire(getScratchOrgChanges) wiredAccount({
    error,
    data
  }) {
    var changeslist = [];
    var username;
    if (data) {
      if (
        data.Components_Changed_Time__c != null &&
        data.Components_Changed_Time__c != ""
      )
        this.lastModifiedDate = data.Components_Changed_Time__c;
      else {
        this.lastModifiedDate = data.CreatedDate;
      }
      data.Components_Changed__c.split(/\r?\n/).forEach(function (element) {
        if (
          !element.startsWith("STATE") &&
          !element.startsWith("===") &&
          !element.startsWith("─────")
        ) {
          var res = element.split(/[ ,]+/);

          var cell = {
            state: res[0],
            fullname: res[1],
            type: res[2],
            projectpath: res[3]
          };
          changeslist.push(cell);
        }
      });

      data.Org_Details__c.split(/\r?\n/).forEach(function (element) {
        if (element.includes("Username ")) {
          username = element.replace("Username ", "").trim();
        }
      });
      this.username = username;
      if (data.ReqID__c != null && data.ReqID__c != "") {
        this.reqid = data.ReqID__c;
      }
      if (data.ReqSFID__c != null && data.ReqSFID__c != "") {
        this.reqsfid = data.ReqSFID__c;
      }

      this.listofChanges = changeslist;
    } else if (error) {
      this.error = error;
      this.record = undefined;
    }
  }

}