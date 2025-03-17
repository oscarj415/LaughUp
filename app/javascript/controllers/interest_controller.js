import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "count"]

  connect() {
    console.log("Interest controller connected");
    console.log(this.formTarget.action);
  }


  toggle() {

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
    })
    .then(response => response.json())
    .then(data => {
      console.log(data);
    });
  }
}
