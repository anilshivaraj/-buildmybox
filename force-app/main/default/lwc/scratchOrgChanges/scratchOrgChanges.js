import { LightningElement, api, wire, track } from 'lwc';
import getScratchOrgChanges from "@salesforce/apex/ScratchOrgDetails.getScratchOrgChanges";

export default class ScratchOrgChanges extends LightningElement {
    @api recordId;
    @track record;
    @track error;
    @track lastModifiedDate;

    @track
    listofChanges = [];

    @wire(getScratchOrgChanges) wiredAccount({ error, data }) {
        var username = [];
        if (data) {
            if(data.Components_Changed_Time__c != null && data.Components_Changed_Time__c != '')
                this.lastModifiedDate = data.Components_Changed_Time__c;
            else
                this.lastModifiedDate = data.CreatedDate;
            data.Components_Changed__c.split(/\r?\n/)
            .forEach(function(element) {
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
                username.push(cell);
                }
            });
            this.listofChanges = username;
        }else if (error) {
            this.error = error;
            this.record = undefined;
        }
    }

    
}
