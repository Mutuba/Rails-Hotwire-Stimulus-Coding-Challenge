// app/javascript/controllers/reveal_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["estimation", "checkMark"];

  connect() {
    this.hideEstimation();
  }

  reveal() {
    this.showEstimation();
  }

  showEstimation() {
    this.estimationTarget.classList.remove("hidden");
    this.checkMarkTarget.classList.add("hidden");
  }

  hideEstimation() {
    this.estimationTarget.classList.add("hidden");
    this.checkMarkTarget.classList.remove("hidden");
  }
}
