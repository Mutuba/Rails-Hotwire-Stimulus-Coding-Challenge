// app/javascript/controllers/modal_controller.js
// import { Controller } from "@hotwired/stimulus";
import { Controller } from "stimulus";

export default class extends Controller {
  close() {
    this.element.classList.add("hidden");
  }
}
