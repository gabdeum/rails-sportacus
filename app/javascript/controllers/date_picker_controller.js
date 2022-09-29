import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {

  static targets = ["dates", "start", "end", "from", "to", "total", "days"]
  static values = {
    dailyRate: Number,
    disabledDates: Array
  }

  connect() {
    // console.log(this.disabledDatesValue)
    const today  = new Date()
    let options = { weekday: 'long', year: 'numeric', month: 'short', day: 'numeric' };
    let setDates = (date) => {
      this.fromTarget.innerHTML = date[0].toLocaleDateString("en-US", options)
      // let minRentDays = {
      //   from: date[0],
      //   to: new Date(date[0]).fp_incr(2)
      // }
      // console.log(this.disabledDatesValue.concat(minRentDays))
      // this.flatpickr.set("disable", this.disabledDatesValue.concat(minRentDays))
      if (date.length == 2) {
        const diffDays = Math.ceil(Math.abs(date[1] - date[0]) / (1000 * 60 * 60 * 24)) + 1;
        this.startTarget.value = date[0]
        this.endTarget.value = date[1]
        this.toTarget.innerHTML = date[1].toLocaleDateString("en-US", options)
        this.daysTarget.innerHTML = diffDays
        this.totalTarget.innerHTML = "<b>$ " + (diffDays * this.dailyRateValue).toString() + ".00</b>"
      }
      else {this.toTarget.innerHTML = ""}
    }

    this.flatpickr = new flatpickr(this.datesTarget, {
      inline: true,
      mode: "range",
      onChange: setDates,
      minDate: today,
      dateFormat: "Y-m-d",
      disable: this.disabledDatesValue
    });
  }

  disconnect() {
    this.flatpickr.destroy()
  }

}
