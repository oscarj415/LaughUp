import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["comedian", "venue", "userType"]

  connect() {
    console.log("connected");
  }

  changeFields() {
    const userType = this.userTypeTarget.value;
    console.log(userType);

    this._disableFields(this.comedianTarget);
    this._disableFields(this.venueTarget);

    if (userType === "comedian") {
      this.venueTarget.classList.add("d-none");
      this.comedianTarget.classList.remove("d-none");
      this._enableFields(this.comedianTarget);
    } else if (userType === "venue") {
      this.comedianTarget.classList.add("d-none");
      this.venueTarget.classList.remove("d-none");
      this._enableFields(this.venueTarget);
    } else {
      this.comedianTarget.classList.add("d-none");
      this.venueTarget.classList.add("d-none");
    }
  }

  _disableFields(target) {
    target.querySelectorAll("input, textarea, select").forEach((el) => {
      el.disabled = true;
    });
  }

  _enableFields(target) {
    target.querySelectorAll("input, textarea, select").forEach((el) => {
      el.disabled = false;
    });
  }
}
