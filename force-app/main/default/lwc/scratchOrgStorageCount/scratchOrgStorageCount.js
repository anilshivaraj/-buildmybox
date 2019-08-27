import { LightningElement, wire, track } from 'lwc';
import getOrgCountDetails from "@salesforce/apex/ScratchOrg_ServiceHandler.getOrgCountDetailsUpgraded";

export default class ScratchOrgStorageCount extends LightningElement {
    @track
    record;

    @wire(getOrgCountDetails) contact({ error, data }) {
        if (data) {
            this.record = data;
        } else if (error) {
            this.error = error;
            this.record = undefined;
        }
    }
}