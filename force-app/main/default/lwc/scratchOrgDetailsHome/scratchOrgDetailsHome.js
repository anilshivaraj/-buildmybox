import { LightningElement, wire, track } from "lwc";
import getScratchOrgDetails from "@salesforce/apex/ScratchOrg_ServiceHandler.getScratchOrgDetails";

export default class ScratchOrgDetailsHome extends LightningElement {
  @track isSelected = false;
  @track
  username;
  password;
  instanceurl;
  edition;
  expirationdate;
  accesstoken;
  alias;
  createdby;
  createddate;
  devhubid;
  recid;
  orgname;
  status;
  remainingDays;
  expired;
  lastModifiedDate;
  requrl;

  @wire(getScratchOrgDetails) contact({ error, data }) {
    if (data) {
      this.record = data.Org_Details__c;
      this.requrl =
        data.Req_ID__c +
        "/lightning/r/Request_Scratch_Org__c/" +
        data.ReqSFID__c +
        "/view";
      if (
        data.Components_Changed_Time__c != null &&
        data.Components_Changed_Time__c != ""
      )
        this.lastModifiedDate = data.Components_Changed_Time__c;
      else this.lastModifiedDate = data.CreatedDate;
      this.error = undefined;
      var username;
      var password;
      var instanceurl;
      var edition;
      var expirationdate;
      var accesstoken;
      var alias;
      var createdby;
      var createddate;
      var devhubid;
      var recid;
      var orgname;
      var status;
      this.record.split(/\r?\n/).forEach(function(element) {
        if (element.includes("Username ")) {
          username = element.replace("Username ", "");
        } else if (element.includes("Password ")) {
          password = element.replace("Password ", "");
        } else if (element.includes("Status ")) {
          status = element.replace("Status ", "");
        } else if (element.includes("Instance Url ")) {
          element = element.replace("Instance Url ", "");
          instanceurl = element.replace(".com/", ".com");
        } else if (element.includes("Edition ")) {
          edition = element.replace("Edition ", "");
        } else if (element.includes("Expiration Date ")) {
          element = element.replace("Expiration Date ", "");
          expirationdate = Date.parse(element);
        } else if (element.includes("Created By ")) {
          createdby = element.replace("Created By ", "");
        } else if (element.includes("Created Date ")) {
          element = element.replace("Created Date ", "");
          createddate = Date.parse(element.trim());
        } else if (element.includes("Access Token ")) {
          accesstoken = element.replace("Access Token ", "");
        } else if (element.includes("Dev Hub Id ")) {
          devhubid = element.replace("Dev Hub Id ", "");
        } else if (element.includes("Id ")) {
          recid = element.replace("Id ", "");
        } else if (element.includes("Org Name ")) {
          orgname = element.replace("Org Name ", "");
        } else if (element.includes("Alias ")) {
          alias = element.replace("Alias ", "");
        }
      });
      this.username = username;
      this.password = password;
      this.instanceurl = instanceurl;
      this.edition = edition;
      this.expirationdate = expirationdate;
      this.accesstoken = accesstoken;
      this.alias = alias;
      this.createdby = createdby;
      this.createddate = createddate;
      this.devhubid = devhubid;
      this.recid = recid;
      this.orgname = orgname;
      this.status = status;
      if (new Date(expirationdate).getTime() - new Date().getTime() > 0) {
        const diffTime = Math.abs(
          new Date(expirationdate).getTime() - new Date().getTime()
        );
        this.remainingDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
        this.expired = false;
      } else {
        this.remainingDays = 0;
        this.expired = true;
      }
    } else if (error) {
      this.error = error;
      this.record = undefined;
    }
  }

  handleCopy() {
    var copytext =
      "Instance URL " +
      this.instanceurl +
      "\nUsername " +
      this.username +
      "\nPassword " +
      this.password +
      "\nAlias " +
      this.alias;
    this.isSelected = !this.isSelected;
    var hiddenInput = document.createElement("textArea");
    hiddenInput.appendChild(document.createTextNode(copytext));
    document.body.appendChild(hiddenInput);
    hiddenInput.select();
    document.execCommand("copy");
  }
}