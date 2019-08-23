/* eslint-disable no-console */
import { LightningElement, track, wire } from "lwc";
import { registerListener, unregisterAllListeners } from "c/pubsub";
import { CurrentPageReference } from "lightning/navigation";

export default class NoTi5SelectedUserDetails extends LightningElement {
  @wire(CurrentPageReference) pageRef;

  @track user;

  @track Title = "User Name";

  connectedCallback() {
    registerListener("userSelected", this.handleuserSelected, this);
  }

  disconnectedCallback() {
    unregisterAllListeners(this);
  }

  handleuserSelected(userid) {
    this.user = userid[1].data.lusers.find(user => user.userId === userid[0]);
    this.Title = this.user.Name;
  }
}