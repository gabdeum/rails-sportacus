import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {

  static targets = ["dates", "start", "end", "from", "to", "total", "days"]
  static values = { dailyRate: Number }

  connect() {
    console.log(typeof(this.dailyRateValue))
    const today  = new Date()
    let options = { weekday: 'long', year: 'numeric', month: 'short', day: 'numeric' };
    let setDates = (date) => {
      this.fromTarget.innerHTML = date[0].toLocaleDateString("en-US", options)
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
      minDate: today
    });
  }

}
