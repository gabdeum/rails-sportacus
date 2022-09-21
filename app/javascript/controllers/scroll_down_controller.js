import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-down"
export default class extends Controller {

  static targets = ["title"]

  fabClick() {
    this.titleTarget.scrollIntoView()
  }
}
