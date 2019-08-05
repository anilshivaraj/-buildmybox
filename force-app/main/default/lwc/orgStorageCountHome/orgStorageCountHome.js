import { LightningElement, wire, track } from "lwc";
import getOrgCountDetails from "@salesforce/apex/ScratchOrgDetails.getOrgCountDetailsUpgraded";
import getOrglimit from "@salesforce/apex/ScratchOrgDetails.getOrglimits";

export default class OrgStorageCountHome extends LightningElement {
  @track
  record;

  @track
  apilimit;

  listoflimits = [];

  @wire(getOrgCountDetails) contact({ error, data }) {
    if (data) {
      this.record = data;
    } else if (error) {
      this.error = error;
      this.record = undefined;
    }
  }

  @wire(getOrglimit) limits({ error, data }) {
    if (data) {
      var username = [];
      this.apilimit = data;
      data.split(/\r?\n/).forEach(function(element) {
        if (!element.startsWith("NAME") && !element.startsWith("──────")) {
          var res = element.split(/[ ,]+/);
          var cell = {
            Name: res[0],
            Remaining: res[1],
            Max: res[1]
          };
          username.push(cell);
        }
      });
      this.listoflimits = username;
      console.log("#### " + JSON.stringify(username));
    } else if (error) {
      this.error = error;
      this.apilimit = undefined;
    }
  }
}
