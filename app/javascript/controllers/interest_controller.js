import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "count"]

  connect() {
    console.log("Interest controller connected");
    console.log(this.formTarget);
  }

  toggle(event) {
    event.preventDefault(); // Stop page refresh

    fetch(this.formTarget.action, {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content // X-CSRF-Token: Necessary for Rails to verify that the request is coming from an authorized session (CSRF protection).
      }
    })
    .then(response => response.json())
    .then(data => {
      console.log(data);

      if (data.status === "interested") {
        this.formTarget.innerHTML = '<input type="submit" value="Cancel" class="interest-button">';
      } else if (data.status === "canceled") {
        this.formTarget.innerHTML = '<input type="submit" value="I\'m going" class="interest-button">';
      }
      this.countTarget.innerText = data.count;
    });
  }
}
