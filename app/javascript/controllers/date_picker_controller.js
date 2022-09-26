import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {

  static targets = ["dates", "start", "end"]

  connect() {
    const today  = new Date()
    let setDates = (date) => {
      if (date.length == 2) {
        // console.log(date[0].toISOString())
        this.startTarget.value = date[0]
        this.endTarget.value = date[1]
      }
    }
    this.flatpickr = new flatpickr(this.datesTarget, {
      inline: true,
      mode: "range",
      onChange: setDates,
      minDate: today
    });
  }

}
