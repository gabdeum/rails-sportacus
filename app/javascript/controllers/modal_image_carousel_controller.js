import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"

// Connects to data-controller="modal-image-carousel"
export default class extends Controller {

  static targets = ["modal"]

  connect() {
  }

  imageClick() {
    this.modalTarget.style.display = "block";
  }

  closeClick() {
    this.modalTarget.style.display = "none";
  }

  modalClick(event) {
    if (event.target == this.modalTarget) {
      this.modalTarget.style.display = "none";
    }
  }

}
