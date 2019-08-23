/* eslint-disable no-unused-vars */
/* eslint-disable no-console */
import { LightningElement, api, track } from "lwc";
import { loadScript } from "lightning/platformResourceLoader";
import chartjs from "@salesforce/resourceUrl/chart";

export default class NoTi5Chart extends LightningElement {
  chart;

  chartjsinitialized;

  @api
  acknowledged;

  @api
  notacknowledged;

  @api
  refresh() {
    this.chartjsinitialized = true;
    loadScript(this, chartjs)
      .then(() => {
        const ctx = this.template
          .querySelector("canvas.donut")
          .getContext("2d");
        let config = {
          type: "doughnut",
          data: {
            datasets: [
              {
                data: [this.acknowledged, this.notacknowledged],
                backgroundColor: ["rgb(54, 162, 235)", "rgb(255, 99, 132)"],
                label: "Dataset 1"
              }
            ],
            labels: [
              "Responded (" + this.acknowledged + ")",
              "Not Responded (" + this.notacknowledged + ")"
            ]
          },
          options: {
            responsive: true,
            legend: {
              position: "right"
            },
            animation: {
              animateScale: true,
              animateRotate: true
            }
          }
        };
        this.chart = new window.Chart(ctx, config);
      })
      .catch(error => {
        this.error = error;
      });
  }

  renderedCallback() {
    if (this.chartjsinitialized) {
      return;
    }
    this.chartjsinitialized = true;
    loadScript(this, chartjs)
      .then(() => {
        const ctx = this.template
          .querySelector("canvas.donut")
          .getContext("2d");
        let config = {
          type: "doughnut",
          data: {
            datasets: [
              {
                data: [this.acknowledged, this.notacknowledged],
                backgroundColor: ["rgb(54, 162, 235)", "rgb(255, 99, 132)"],
                label: "Dataset 1"
              }
            ],
            labels: [
              "Responded (" + this.acknowledged + ")",
              "Not Responded (" + this.notacknowledged + ")"
            ]
          },
          options: {
            responsive: true,
            legend: {
              position: "right"
            },
            animation: {
              animateScale: true,
              animateRotate: true
            }
          }
        };
        this.chart = new window.Chart(ctx, config);
      })
      .catch(error => {
        this.error = error;
      });
  }
}