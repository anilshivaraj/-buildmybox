/* eslint-disable eqeqeq */
/* eslint-disable no-console */
import { LightningElement, wire, api, track } from "lwc";
import getCount from "@salesforce/apex/Noti5_NotificationUtility.getCount";
import getchartMetrics from "@salesforce/apex/Noti5_NotificationUtility.getchartMetrics";
import { refreshApex } from "@salesforce/apex";
import { fireEvent } from "c/pubsub";
import { CurrentPageReference, NavigationMixin } from "lightning/navigation";

const DELAY = 300;

export default class NoTi5 extends NavigationMixin(LightningElement) {
  @api recordId;

  @wire(CurrentPageReference) pageRef;

  @track searchKey = "";

  @track page = 1;

  @track acknowledgefilter = "";
  @track notacknowledgefilter = "";

  @track processing = false;

  @track hasMorePages = false;

  @track hasPreviousPage = false;

  @wire(getchartMetrics, {
    notificationId: "$recordId"
  })
  chartMetrics;

  @wire(getCount, {
    notificationId: "$recordId",
    searchKey: "$searchKey",
    acknowledgedfilter: "$acknowledgefilter",
    notacknowledgefilter: "$notacknowledgefilter",
    iPage: "$page"
  })
  countdetails;

  chart;
  respondedcount = null;
  notrespondedcount = null;
  hasPreviousPage = false;
  hasMorePages = false;

  handleKeyChange(event) {
    this.processing = true;
    window.clearTimeout(this.delayTimeout);
    const searchKey = event.target.value;
    // eslint-disable-next-line @lwc/lwc/no-async-operation
    this.delayTimeout = setTimeout(() => {
      this.searchKey = searchKey;
    }, DELAY);
  }

  handleSelect(event) {
    fireEvent(this.pageRef, "userSelected", [
      event.target.dataset.id,
      this.countdetails
    ]);
  }

  handleacknowledgefilter() {
    this.notacknowledgefilter = "";
    if (this.acknowledgefilter === "brand") {
      this.acknowledgefilter = "";
    } else {
      this.acknowledgefilter = "brand";
    }
    this.page = 1;
    this.processing = true;
  }

  handlenotacknowledgefilter() {
    this.acknowledgefilter = "";
    if (this.notacknowledgefilter === "brand") {
      this.notacknowledgefilter = "";
    } else {
      this.notacknowledgefilter = "brand";
    }
    this.page = 1;
    this.processing = true;
  }

  handlerefresh() {
    this.processing = true;
    this.searchKey = "";
    this.acknowledgefilter = "";
    this.notacknowledgefilter = "";
    this.page = 1;
    refreshApex(this.countdetails);
    refreshApex(this.chartMetrics);
    this.template.querySelector("c-no-ti5-chart").refresh();
  }

  renderedCallback() {
    this.processing = false;
    if (this.countdetails.data != undefined) {
      if (this.page < this.countdetails.data.totalpages) {
        this.hasMorePages = true;
      } else this.hasMorePages = false;
    }
    if (this.countdetails.data != undefined)
      if (this.countdetails.data.totalpages > 1 && this.page > 1) {
        this.hasPreviousPage = true;
      } else this.hasPreviousPage = false;
  }

  handlePageNext() {
    if (this.page <= this.countdetails.data.totalpages) {
      this.page = this.page + 1;
      this.processing = true;
    }
  }

  handlePagePrevious() {
    if (this.page > 1) {
      this.page = this.page - 1;
      this.processing = true;
    }
  }
}