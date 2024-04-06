import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["quantity"];

  add() {
  	this.quantityTarget.value = parseInt(this.quantityTarget.value) + 1
  }

  subtract() {
  	if(parseInt(this.quantityTarget.value) <= 0) { return }
  	this.quantityTarget.value = parseInt(this.quantityTarget.value) - 1
  }
}
